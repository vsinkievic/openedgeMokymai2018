define variable id as integer no-undo.
define variable iCust as integer no-undo.
define variable dtDate as datetime no-undo.
define variable dcAmount as decimal no-undo.

define frame fUzs-keitimas 
     id label "Uþsakymo numeris" dtDate label "Data" skip
     iCust label "Uþsakovo kodas:" skip
     dcAmount label "Suma"
     with side-labels 1 col width 150.

define frame uzs-apzvalga
    Order.Id skip
    Order.Date skip
    Order.Customerid Customer.Name skip
    Order.amount
    with side-labels 1 col width 100.


update id 
    label "Uþsakymo numeris" 
    help "Áveskite uþsakymo numerá"
    with side-labels. 

find Order where Order.Id = id exclusive-lock no-error.
if not available Order then message "Tokio uþsakymo nëra" view-as alert-box.
else do:
    
    find Customer where Customer.Id = Order.CustomerId.
    iCust = Order.CustomerId.
    dcAmount = Order.Amount.
    update  iCust label "Uþsakovo kodas" 
            dcAmount label "Suma" 
            dtDate format "9999-99-99" label "Data"
            with 1 col width 100.
    find Customer where Customer.Id = iCust no-lock.
    if not available Customer then message "Tokio uþsakovo nëra" view-as alert-box.
    else do:
        Order.Date = dtDate.
        Order.CustomerId = iCust.
        Order.Amount = dcAmount.
        display Order.Id Order.Date Order.CustomerId Customer.Name Order.Amount
        with frame uzs-apzvalga.
    end.
    
 end.

