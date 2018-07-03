
define variable isOk as log no-undo.

define query qCust for Customer scrolling.
define browse bCust query qCust no-lock 
    display Customer.Id Customer.Name Customer.OrdersCount 
    Customer.OrdersTotal 
    with 15 down no-assign expandable title "Klientai".

define button buttonCustCreate label "Naujas Uþsakovas".
define button buttonNewOrder label "Naujas uþsakymas".
define button buttonLeave label "Baigti darbà" auto-endkey.


on "insert" of browse bCust do:
    hide all.
    run create_customer.
    close query qCust.
    open query qCust for each Customer.
    browse bCust:refresh().
end.

on "ctrl-N" of browse bCust do:
    hide all.
    run create_customer.
    close query qCust.
    open query qCust for each Customer.
    browse bCust:refresh().
end.

on "delete" of browse bCust do:
    run delete_customer (output isOk).
    if isOK then do:
    close query qCust.
    open query qCust for each Customer.
    browse bCust:refresh().
    end.
    else return no-apply.
end.

define frame fCust 
    buttonCustCreate buttonNewOrder buttonLeave 
    skip (1) space (8) bCust skip(1) space (8) buttonCustCreate
    with no-box width 150.
    
on default-action of browse bCust do:
    run orders_by_customer (input Customer.id).
end.
    
on choose of buttonCustCreate do:
    run create_customer.
end.

on choose of buttonLeave do:
    hide all.
    quit.
end.

on choose of buttonNewOrder do:
    run order_create (input Customer.id).
end.

open query qCust for each Customer.
enable all with frame fCust.
    apply "value-changed" to browse bCust.
wait-for window-close of current-window.


{programa_procedures.p}

