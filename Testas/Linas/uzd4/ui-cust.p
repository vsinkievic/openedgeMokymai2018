define variable cName as character no-undo.

define temp-table ttCustomer
    field Num as integer 
    field Cust-name as character
    field Balance as decimal.
define temp-table ttOrder
    field Num as integer 
    field Cust-num as integer 
    field Order-date as datetime.

define query qCust for ttCustomer scrolling.

define browse bCust query qCust
    display ttCustomer.Num ttCustomer.Cust-name ttCustomer.Balance
    with 10 down no-assign expandable title "Customers".

define frame fCust 
    skip (1) space (8) bCust skip(1) space (8)
    with no-box width 150.

on default-action of browse bCust do:
    run ui-orders.p (input ttCustomer.Num).
    browse bCust:refresh().
end.

repeat:

    update cName.
    if cName = "" then leave.
    
    run sget-cust.p (input cName, output table ttCustomer).
    open query qCust for each ttCustomer. 
    
    enable all with frame fCust.
    
end.
                            

