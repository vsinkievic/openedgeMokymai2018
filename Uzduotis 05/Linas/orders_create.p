define variable i as integer no-undo.

define frame uzs-ivedimas
    Order.Customerid skip
    Order.Amount
    with side-labels 1 col width 100.

create Order.

display "Naujas uþsakymas" skip with stream-io.
display "Data: " now format "9999-99-99" skip with stream-io.
update Order.Customerid Order.Amount
    with frame uzs-ivedimas.  

if Order.Id <> 0 then
    display Order with side-labels 1 col width 100 with stream-io.
