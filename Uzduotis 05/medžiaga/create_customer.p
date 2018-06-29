define variable i as integer no-undo.

for each Customer no-lock 
    by custnum descending
     i = 1 to 5
        :
    display Customer.CustNum Customer.Name Customer.city.
end.

do transaction:
    create Customer. 
    message Customer.CustNum.
    
    Customer.Name = "Vardenis".
    
    display custnum name. 
    update Customer.City help "Áveskite miestà".
   // undo, leave.
end.
message "po tranzakcijos". 