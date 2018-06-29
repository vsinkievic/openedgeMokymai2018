trigger procedure for replication-write of con_doch.

/* ************************  Function Prototypes ********************** */
function scheduleTask returns character 
    ( pcExecutor as char, pcBusinessKey as char, ptDueDate as datetime, piPriority as int, pcPayload as longchar ) forward.

def var cSendTrx as char no-undo init "bonus/tasks/task_send_trx.r".
def var cAmountCalculator as char no-undo init "lapi/tasks/task_calculate_ls_amounts.r".

find first bpm_task no-lock where bpm_task.business_key = string(con_doch.cdh_id) and bpm_task.executor = cSendTrx no-error.
if not available bpm_task
then do:
    create bpm_task.
    bpm_task.business_key = string(con_doch.cdh_id).
    bpm_task.payload = string(con_doch.cdh_id).
    bpm_task.executor = cSendTrx.
    bpm_task.priority = 20.
    bpm_task.due_date = now + 5000.
    release bpm_task.
end.

if con_doch.fcn_id <> 0
then do: 
    find ls_con no-lock where ls_con.fcn_id = con_doch.fcn_id no-error.
    if available ls_con
    then do:
        scheduleTask(cAmountCalculator, ls_con.lcn_num, ?, 90, ls_con.lcn_num).
    end.
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
    
    if ptDueDate <> ?
    then bpm_task.due_date = ptDueDate.

    if piPriority <> 0
    then bpm_task.priority = piPriority.
    release bpm_task.
    return "".
end function.

