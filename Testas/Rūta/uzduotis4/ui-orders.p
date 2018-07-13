
define input parameter custNum as int no-undo.
define query qOrder for Order.

find Customer where Customer.CustNum = custNum.
display Customer.Name Customer.Balance.
define browse bOrder query qOrder display Order.OrderNum Order.OrderDate with 10 down title "Klientu sarasas".
define frame fOrder bOrder skip with center.

open query qOrder for each Order where Order.CustNum = custNum no-lock by Order.OrderDate desc max-rows 100.
enable bOrder with frame fOrder.

wait-for window-close of current-window.