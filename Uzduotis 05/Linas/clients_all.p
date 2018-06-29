 // procedûra visø klientø iðvedimui

for each Customer by Customer.OrdersTotal descending:
    display Customer.Id Customer.Name Customer.orderscount Customer.OrdersTotal 
        with stream-io.
    for each Order where Order.CustomerId = Customer.Id by Order.date:
        display Order.Id Order.Date Order.Amount with stream-io.
    end.
end.