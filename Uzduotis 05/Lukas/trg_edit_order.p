trigger procedure for write of Orders new buffer newOrder old buffer oldOrder.

if oldOrder.OrderNr <> 0 then do:

    if newOrder.CustId <> oldOrder.CustId then do:
        
        find Customer where Customer.CustId = oldOrder.CustId exclusive-lock.
        Customer.OrderTotal = Customer.OrderTotal - oldOrder.OrderAmount.
        Customer.TotalOrders = Customer.TotalOrders - 1.
        find Customer where Customer.CustId = newOrder.CustId  exclusive-lock.
        Customer.OrderTotal = Customer.OrderTotal + newOrder.OrderAmount.
        Customer.TotalOrders = Customer.TotalOrders + 1.
        message "Uþsakymas modifikuotas" view-as alert-box.
         
    end.
    else do:
        
        find Customer where Customer.CustId = newOrder.CustId exclusive-lock.
        Customer.OrderTotal = Customer.OrderTotal + newOrder.OrderAmount - oldOrder.OrderAmount.
        message "Uþsakymas modifikuotas" view-as alert-box.
        
    end.

end.
else message "Uþsakymas sukurtas" view-as alert-box.
