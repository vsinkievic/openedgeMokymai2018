define variable id as integer no-undo.
define variable dcAmount as decimal no-undo.

define frame uzs-ivedimas
    id label "Uþsakovo kodas:" skip
    dcAmount label "Suma:"
    with side-labels 1 col width 100.

define frame uzs-apzvalga
    Order.Id skip
    Order.Date skip
    Order.Customerid Customer.Name skip
    Order.amount
    with side-labels 1 col width 100.

display "Naujas uþsakymas" skip with stream-io.
display "Data: " now format "9999-99-99" skip with stream-io.

update id dcAmount
    with frame uzs-ivedimas.  

find Customer where Customer.Id = id no-lock no-error.
if not available Customer then 
    message "Tokio uþsakovo nëra!" view-as alert-box.
else do:
    create Order.
    Order.Amount = dcAmount.
    Order.CustomerId = id.
    display Order.Id Order.Date Order.CustomerId Customer.Name Order.Amount
        with frame uzs-apzvalga.
end.
   
