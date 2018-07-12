
define variable id as integer no-undo init 1.
define variable order_id as integer no-undo.
define variable lAnswer as log no-undo.

define temp-table ttCustomer like Customer.
define temp-table ttOrder like Order before-table befOrder.

define temp-table pttCustomer like Customer.
define temp-table pttOrder like Order before-table bOrder.


define dataset dsDuomenys for ttCustomer, ttOrder
    data-relation rel1 for ttCustomer, ttOrder relation-fields(cust-num, cust-num) nested.

define dataset dsPakeitimai for pttCustomer, pttOrder
    data-relation rel1 for pttCustomer, pttOrder relation-fields(cust-num, cust-num) nested.
    
    
define data-source srcCustomer for Customer.
define data-source srcOrder for Order.

buffer ttCustomer:attach-data-source(data-source srcCustomer:handle).
buffer ttOrder:attach-data-source(data-source srcOrder:handle).

data-source srcCustomer:fill-where-string = "where Customer.Country = 'France'".
dataset dsDuomenys:fill().




define query qCust for ttCustomer scrolling.
define browse bCust query qCust no-lock 
    display ttCustomer.Cust-num ttCustomer.Name 
    with 15 down no-assign expandable title "Customers".

define button buttonCustCreate label "New Customer".
define button buttonNewOrder label "New Order".
define button buttonShowChanges label "Show changes".
define button buttonLeave label "Exit" auto-endkey.

define frame fCust 
    buttonNewOrder buttonShowChanges buttonLeave 
    skip (1) space (8) bCust skip(1) space (8) buttonCustCreate
    with no-box width 150.
    
on default-action of browse bCust do:
    run orders_by_customer (input ttCustomer.Cust-Num).
end.
    
on choose of buttonNewOrder do:
    find last ttOrder.
    run createOrder (ttOrder.Cust-num).
end.

on choose of buttonShowChanges do:
    run showChanges.
end.


on choose of buttonLeave do:
    hide frame fCust.
    quit.
end.

temp-table ttOrder:tracking-changes = true.

open query qCust for each ttCustomer.
enable all with frame fCust.
apply "value-changed" to browse bCust.
wait-for window-close of current-window.


buffer ttCustomer:detach-data-source().
buffer ttOrder:detach-data-source().
buffer pttCustomer:detach-data-source().
buffer pttOrder:detach-data-source().
buffer befOrder:detach-data-source().




{dataset_procedures.i}


    
