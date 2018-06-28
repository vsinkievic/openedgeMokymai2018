define variable i as integer no-undo.

for each Order no-lock 
        where Order.CustNum < 100,
    first Customer no-lock 
        where Customer.CustNum = Order.custnum
    by Customer.Name by Order.OrderDate descending by Order.Carrier
            i = 1 to 10:
    
  //  i = i + 1.
 /*   if i > 10 then leave. */
    
    display Order.Ordernum Orderstatu orderdate 
        with width 400.
    
//    find Customer no-lock where Customer.CustNum = Order.CustNum. 
  //  find Customer no-lock of order. 
    display Customer.Name label "ClientName". 
end.