

define variable vidinis as character no-undo init "vidinis".

define variable iLastCustomer as integer no-undo init 0.


if not this-procedure:persistent then do:
    message "persistent_proc.p" vidinis. 
    
    run display_customers.

end.


procedure display_customers: 
    define variable i as integer no-undo. 
    message "procedure display_customers in persistent_proc.p".
    
    find first Customer no-lock where Customer.CustNum > iLastCustomer 
        use-index custnum no-error.
        
    repeat i = 1 to 5: 
        // mûsø programos logika.....
        
        display Customer.CustNum Customer.Name.
        iLastCustomer = Customer.CustNum.
        find next Customer. 
    end.    
end.