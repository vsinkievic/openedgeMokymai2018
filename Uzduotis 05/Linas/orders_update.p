define variable id as integer no-undo.
define variable iCust as integer no-undo.
define variable dtDate as integer no-undo.
define variable cName as integer no-undo.
define variable dcAmount as decimal no-undo.

define frame fUpdate 
     id label "Uþsakymo numeris" dtDate label "Data" skip
     iCust cName label "Uþsakovas" skip
     dcAmount label "Suma"
     with side-labels 1 col width 150.

update id 
    label "Uþsakymo numeris" 
    help "Áveskite uþsakymo numerá"
    with side-labels. 

find Order where Order.Id = id exclusive-lock no-error.
if not available Order then message "Tokio uþsakymo nëra".
else do:
    
    find Customer where Customer.Id = Order.CustomerId.
    iCust = Order.CustomerId.
    dcAmount = Order.Amount.
    display Order.Id Order.Date iCust Customer.Name dcAmount with frame fUpdate.
    update  iCust dcAmount
        with frame fUpdate.
    find Customer where Customer.Id = iCust no-lock.
    if not available Customer then message "Tokio uþsakovo nëra".
    else do:
        Order.CustomerId = iCust.
        Order.Amount = dcAmount.
    end.
 end.

