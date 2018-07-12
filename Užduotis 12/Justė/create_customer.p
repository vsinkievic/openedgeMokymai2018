using Progress.Lang.AppError from propath.

{dsCustomer.i}
define input-output parameter dataset for dsCustomer.

define variable iCustNum as integer no-undo label "Kliento nr." format ">>>>>>>>>>".
define variable cCountry as character no-undo label "Ðalis" format "x(20)".
define variable cName as character no-undo label "Vardas" format "x(20)".
define variable cPhone as character no-undo label "Tel. nr." format "x(20)".

define frame fCreate iCustNum skip cCountry skip cName skip cPhone with 1 col center.

update iCustNum cCountry cName cPhone with frame fCreate.

temp-table ttCustomer:tracking-changes = true.

create ttCustomer.

assign 
    ttCustomer.custnum = iCustNum
    ttCustomer.country = cCountry
    ttCustomer.name = cName
    ttCustomer.phone = cPhone.
    
display iCustNum skip cCountry skip cName skip cPhone with frame fCreate title "Naujas klientas". 
    
catch e as Progress.Lang.Error :
    undo, throw new AppError("Tokio kliento sukurti negalima!",0).
end catch.

finally:
    temp-table ttCustomer:tracking-changes = false.
    hide frame fCreate.
end.

