using loan.domain.CdhType from propath.
using Progress.Lang.AppError from propath.
using common.helpers.Converter from propath.

trigger procedure for write of doc_event.

def var cAmountCalculator as char no-undo init "lapi/tasks/task_calculate_ls_amounts.r".

def var cTaskLoanIndex as char no-undo init "loan/tasks/task_loan_index.r".
def var cTaskClientIndex as char no-undo init "crm/tasks/task_client_index.r".
def var cTaskLoadCardInfo as char no-undo init "gps/tasks/task_load_card_info.r".
def var cTaskPayFromAdvance as char no-undo init "loan/tasks/task_pay_from_advance.r".
def var cTaskKpiLoanCount as char no-undo init "loan/tasks/task_kpi_loan_count.r".
def var cTaskKpiLoanAmount as char no-undo init "loan/tasks/task_kpi_loan_amount.r".
def var cTaskKpiApplicationCount as char no-undo init "application/tasks/task_kpi_application_count.r".

/* ************************  Function Prototypes ********************** */
function scheduleTask returns character 
    ( pcExecutor as char, pcBusinessKey as char, ptDueDate as datetime, piPriority as int, pcPayload as longchar ) forward.

find ls_con no-lock where ls_con.fcn_id = doc_event.doc_id no-error.
if available ls_con
then do:
    scheduleTask(cAmountCalculator, ls_con.lcn_num, ?, 90, ls_con.lcn_num).
    scheduleTask(cTaskLoanIndex,        ls_con.lcn_num, ?, 20, ls_con.lcn_num).
    scheduleTask(cTaskKpiLoanCount, "KPI_LOAN_COUNT", add-interval(datetime(today, mtime), 5, "seconds"), 20, "").
    scheduleTask(cTaskKpiLoanAmount, "KPI_LOAN_AMOUNT", add-interval(datetime(today, mtime), 5, "seconds"), 20, "").
    find application no-lock where application.id = ls_con.req_id no-error.
    if available application
    then scheduleTask(cTaskKpiApplicationCount, "KPI_APPLICATION_AMOUNT", add-interval(datetime(today, mtime), 5, "seconds"), 20, Converter:formatDate((application.appl_date), "YYYY-MM-DD")).
end.
find fin_client no-lock where fin_client.fcl_id = doc_event.doc_id no-error.
if available fin_client
then do:
    scheduleTask(cTaskClientIndex, string(fin_client.fcl_id), ?, 20, string(fin_client.fcl_id)).
end.
if doc_event.dce_type = CdhType:PLIQ:ToString()
then do:
    scheduleTask(cTaskPayFromAdvance, ls_con.lcn_num, add-interval(datetime(today, mtime), 5, "minutes"), 0, subst('~{ "loan_no":"&1", "on_date": "&2" }', ls_con.lcn_num, iso-date(today))).
    scheduleTask(cTaskLoadCardInfo, ls_con.lcn_num, add-interval(datetime(today, mtime), 1, "hour"), 0, ls_con.lcn_num).
end.    
if doc_event.dce_type = CdhType:BOOK:ToString()
then do:
    scheduleTask(cTaskPayFromAdvance, ls_con.lcn_num, add-interval(datetime(today, mtime), 5, "minutes"), 0, subst('~{ "loan_no":"&1", "on_date": "&2" }', ls_con.lcn_num, iso-date(today))).
end.    
if doc_event.dce_type = CdhType:AVNCR:ToString()
then do:
    scheduleTask(cTaskLoadCardInfo, ls_con.lcn_num, add-interval(datetime(today, mtime), 1, "hour"), 0, ls_con.lcn_num).
end.   
if doc_event.dce_type = CdhType:DISB:toString() or doc_event.dce_type = CdhType:RDISB:ToString()
then do:
    scheduleTask(cTaskPayFromAdvance, ls_con.lcn_num, add-interval(datetime(today, mtime), 5, "minutes"), 0, subst('~{ "loan_no":"&1", "on_date": "&2" }', ls_con.lcn_num, iso-date(today))).
end.



/* ************************  Function Implementations ***************** */
function scheduleTask returns character 
	(  pcExecutor as char, pcBusinessKey as char, ptDueDate as datetime, piPriority as int, pcPayload as longchar ):
/*------------------------------------------------------------------------------
 Purpose:
 Notes:
------------------------------------------------------------------------------*/	
    find first bpm_task no-lock where bpm_task.business_key = pcBusinessKey and bpm_task.executor = pcExecutor no-error.
    if available bpm_task
    then return "".
   
    create bpm_task.
    bpm_task.executor = pcExecutor.
    bpm_task.business_key = pcBusinessKey.
    bpm_task.payload = pcPayload.
    
    if ptDueDate = ?
    then bpm_task.due_date = now.
    else bpm_task.due_date = ptDueDate.

    if piPriority <> 0
    then bpm_task.priority = piPriority.
    release bpm_task.
    return "".
end function.
