TRIGGER PROCEDURE FOR WRITE OF Order OLD BUFFER oldOrder.



if oldorder.id <> 0 then do:

    if order.customerid <> oldorder.customerid then do:
        find customer where customer.id = oldorder.customerid.
        customer.orderscount = customer.orderscount - 1.
        customer.orderstotal = customer.orderstotal - oldorder.amount.
        find customer where customer.id = order.customerid.
        customer.orderscount = customer.orderscount + 1.
        customer.orderstotal = customer.orderstotal + order.amount.
    end.
    else do:
        find customer where customer.id = order.customerid.
        customer.orderstotal = customer.orderstotal - oldorder.amount + order.amount.
    end.
end.
else do:
    find customer where customer.id = order.customerid.
    customer.orderscount = customer.orderscount + 1.
    customer.orderstotal = customer.orderstotal + order.amount.
end.    

