{dsCustomer.i}




define button bCreate label "Kurti klientà".
define button bDelete label "Trinti klientà".
define button bUpdate label "Keisti klientà".

define variable iNr as integer no-undo label "Kliento numeris" format ">>>>>>>>>>".

define frame fButtons bCreate bDelete bUpdate with center.

define data-source srcCustomer for Customer.
buffer ttCustomer:attach-data-source (data-source srcCustomer:handle).
dataset dsCustomer:fill().

on choose of bCreate do:
    run create_customer(input-output dataset dsCustomer).
    for each ttbeforeCustomer:
        buffer ttbeforeCustomer:save-row-changes no-error.
    end.
    
    catch e as Progress.Lang.AppError :
		message e:GetMessage(1) view-as alert-box.
    end catch.
end.

on choose of bDelete do:
    run delete_customer(input-output dataset dsCustomer).
    for each ttbeforeCustomer:
        buffer ttbeforeCustomer:save-row-changes no-error.
    end.
    
    catch e  as Progress.Lang.AppError :
        message e:GetMessage(1) view-as alert-box.
    end catch.
        
end.

on choose of bUpdate do:
    run update_customer(input-output dataset dsCustomer).
    for each ttbeforeCustomer:
        buffer ttbeforeCustomer:save-row-changes no-error.
    end.
    
    catch e  as Progress.Lang.AppError :
        message e:GetMessage(1) view-as alert-box.
    end catch.
end.

enable bCreate bDelete bUpdate with frame fButtons.
wait-for window-close of current-window.
