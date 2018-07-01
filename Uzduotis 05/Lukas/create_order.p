define variable cOrderName as character format "x(50)" no-undo.
define variable dOrderAmount as decimal format ">>>,>>>,>>>,>>9.99" no-undo.
define variable id as integer no-undo.

define frame orderFr
    id label "Kliento ID" help "�veskite kliento ID"
    cOrderName label "U�sakymo pavadinimas" help "�veskite trump� u�sakymo apra��"
    dOrderAmount label "U�sakymo suma" help "�veskite sum�, kuri� klientas turi apmok�ti u� u�sakym�"
    with side-labels.
    
update id cOrderName dOrderAmount with frame orderFr.

order_creation:
do transaction:

    find Customer where Customer.CustId = id exclusive-lock no-error.
    
    if available Customer then do:
        
        create Orders.
        Orders.CustId = id.
        Orders.OrderName = cOrderName.
        Orders.OrderAmount = dOrderAmount.
        Customer.TotalOrders = Customer.TotalOrders + 1.
        Customer.OrderTotal = Customer.OrderTotal + dOrderAmount.
        
        
    end.
    else do:
        
        message "Klientas su tokiu ID neegzistuoja" view-as alert-box.
        undo, leave order_creation.
        
    end.
    
end.