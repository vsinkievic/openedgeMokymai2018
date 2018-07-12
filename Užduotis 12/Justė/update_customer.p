using Progress.Lang.AppError from propath.

{dsCustomer.i}
define input-output parameter dataset for dsCustomer.

define variable iCustNum as integer no-undo label "Kliento nr." format ">>>>>>>>>>".
define variable cCountry as character no-undo label "Ðalis" format "x(20)".
define variable cName as character no-undo label "Vardas" format "x(20)".
define variable cPhone as character no-undo label "Tel. nr." format "x(20)".

define frame fUpdate1 iCustNum with center.
define frame fUpdate2 ttCustomer.country label "Ðalis" format "x(20)" skip
                      ttcustomer.name label "Vardas" format "x(20)" skip 
                      ttcustomer.phone label "Tel. nr." format "x(20)" with 1 col center.


update iCustNum with frame fUpdate1.

temp-table ttCustomer:tracking-changes = true.

find first ttCustomer where ttCustomer.CustNum = iCustNum.
update ttCustomer.country ttcustomer.name ttcustomer.phone with frame fUpdate2.
    
display ttCustomer.country ttcustomer.name ttcustomer.phone with frame fUpdate2 title "Pakeisti kliento duomenys".
     
catch e as Progress.Lang.Error :
    undo, throw new AppError("Kliento duomenø pakeisti nepavyko!",0).
end catch.

finally:
    temp-table ttCustomer:tracking-changes = false.
    hide frame fUpdate1 frame fUpdate2.
end.