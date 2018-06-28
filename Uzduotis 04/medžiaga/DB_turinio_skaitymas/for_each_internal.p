define variable i as integer no-undo.

for each Customer no-lock 
        where customer.CustNum < 100 
    by Customer.Name 
            i = 1 to 10:
    
    display Customer.Name label "ClientName". 
    
   for each Order no-lock 
        where Customer.CustNum = Order.CustNum
        by Order.OrderDate descending by Order.Carrier: 

    display Order.Ordernum Orderstatu orderdate 
        with width 400.
        
   end.
    
end.