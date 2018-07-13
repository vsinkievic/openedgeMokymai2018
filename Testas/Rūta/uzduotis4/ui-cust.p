
define variable customerName as character no-undo.

update customerName label "Kliento pavadinimo fragmentas".

define query qCustomer for Customer.
define query qOrder for Order.

define browse bCustomer query qCustomer display Customer.Name Customer.Balance with 10 down title "Klientu sarasas".
define frame fCustomer bCustomer skip with center.

open query qCustomer for each Customer where Customer.Name matches(customerName + "*") no-lock by Customer.Balance desc max-rows 100.
enable bCustomer with frame fCustomer.

on enter of bCustomer do:
    run ui-orders(Customer.CustNum).
end.

wait-for window-close of current-window.