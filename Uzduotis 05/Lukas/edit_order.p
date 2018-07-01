define variable orderId as integer no-undo.
define variable cOrderName as character format "x(50)" no-undo.
define variable dOrderAmount as decimal format ">>>,>>>,>>>,>>9.99" no-undo.
define variable id as integer no-undo.


    
define frame newOrderFr
    Orders.CustId label "Kliento ID"
    Orders.OrderName label "U�sakymo pavadinimas"
    Orders.OrderAmount label "U�sakymo suma"
    id label "Kliento ID" help "�veskite kliento ID" 
    cOrderName label "U�sakymo pavadinimas" help "�veskite trump� u�sakymo apra��"
    dOrderAmount label "U�sakymo suma" help "�veskite sum�, kuri� klientas turi apmok�ti u� u�sakym�"
    with side-labels.
    
update orderId label "U�sakymo nr." help "�veskite nr. u�sakymom kur� nor�tum�te modifikuoti" with side-labels.

editing_order:
do transaction:

    find Orders where Orders.OrderNr = orderId  no-error.
    
    if AVAILABLE Orders then do:
        
        display Orders.CustId Orders.OrderName Orders.OrderAmount with frame newOrderFr.
        update id cOrderName dOrderAmount with frame newOrderFr.
        
    end.
    else do:
        
        message "Toks u�sakymas neegzistuoja" view-as alert-box.
        undo, leave editing_order.
        
    end.

end.