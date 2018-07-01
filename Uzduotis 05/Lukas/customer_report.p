output to "customer_report.txt".
    

for each Customer no-lock by Customer.OrderTotal descending:
    
    display "-------------------------------".
    display Customer with side-labels 1 col stream-io.
    display "".
    display "Customer's orders:".
    
    for each Orders no-lock where Orders.CustId = Customer.CustId by Orders.OrderDate:
        
        display Orders with side-labels 1 col stream-io.
        
    end.
    
    
end.

output close.