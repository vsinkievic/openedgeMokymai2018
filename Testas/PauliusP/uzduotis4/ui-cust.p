define variable klientoPavadinimas as character no-undo.

define query k-uzklausa for Customer scrolling.
define browse k-langas query k-uzklausa no-lock display
    Customer.Name Customer.Balance 
    with 5 down.

define variable suma as decimal no-undo.

define query u-uzklausa for Order scrolling.
define browse u-langas query u-uzklausa no-lock display
    Order.Ordernum Order.OrderDate //OrderLine.Qty * OrderLine.Price
    with 5 down.
    
define frame remelis skip (1) 
    k-langas skip (1) u-langas
        with 1 col title "Klientai" center.

on "return" of k-langas do:
    run ui-orders.
    run sget-cust.
end. 

update klientoPavadinimas.

run sget-cust.
enable all with frame remelis.
wait-for window-close of current-window.


procedure sget-cust:
    close QUERY k-uzklausa.
    OPEN QUERY k-uzklausa FOR EACH Customer where Customer.Name begins (klientoPavadinimas) by Customer.Balance descending.
    browse k-langas:refresh() no-error.
end procedure.

procedure ui-orders:
    close query u-uzklausa.
    open query u-uzklausa 
    for each order no-lock where Order.CustNum = Customer.CustNum by Order.OrderDate descending.
    browse u-langas:refresh() no-error.
end procedure.