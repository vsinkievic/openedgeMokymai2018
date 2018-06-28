

for each Order no-lock 
    where Order.CustNum < 100
    by Order.OrderDate descending by Order.Carrier:
    
    display Order.Ordernum Orderstatu orderdate 
    with width 400.
    
//    find Customer no-lock where Customer.CustNum = Order.CustNum. 
    find Customer no-lock of order. 
    display Customer.Name label "ClientName".
end.