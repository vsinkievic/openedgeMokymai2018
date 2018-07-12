using Progress.Lang.AppError from propath.

{dsCustomer.i}
define input-output parameter dataset for dsCustomer.
define variable iCustNum as integer no-undo label "Kliento nr." format ">>>>>>>>>>".
define frame fDelete iCustNum with center.

update iCustNum with frame fDelete.

temp-table ttCustomer:tracking-changes = true.

find first ttCustomer where ttCustomer.CustNum = iCustNum.
delete ttCustomer.
    
display iCustNum with frame fDelete title "Iðtrintas klientas". 
    
catch e as Progress.Lang.Error :
    undo, throw new AppError("Tokio kliento iðtrinti nepavyko!",0).
end catch.

finally:
    temp-table ttCustomer:tracking-changes = false.
    hide frame fDelete.
end.