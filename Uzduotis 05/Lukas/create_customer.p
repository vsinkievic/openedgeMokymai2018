define variable id as integer no-undo.
define variable customerName as character format "x(50)" no-undo.

define frame creationFr
    id label "Kliento kodas" help "�veskite kliento kod�"
    customerName label "Kliento pavadinimas" help "�veskite kliento pavadinim�" 
    with side-labels.
    
update id customerName with frame creationFr.
    
creation:    
do transaction:
    
/*    for each Customer:                                                           */
/*        if id = Customer.CustId then do:                                         */
/*            message "A customer with this id already exists" view-as alert-box.  */
/*            undo, leave creation.                                                */
/*        end.                                                                     */
/*        if customerName = Customer.Name then do:                                 */
/*            message "A customer with this name already exists" view-as alert-box.*/
/*            undo, leave creation.                                                */
/*        end.                                                                     */
/*    end.  
//alt way of checking for duplicate names and ids, not sure which is more efficient.                                                                       */
    
    find Customer where Customer.CustId = id no-lock no-error.

    if available Customer then do:
        message "A customer with this id already exists" view-as alert-box.
        undo, leave creation.
    end.
    else do:
        
        find Customer where Customer.Name = customerName no-lock no-error.
        
        if available Customer then do:
            message "A customer with this name already exists" view-as alert-box.
            undo, leave creation.
        end.
        else do:

            create Customer.
            Customer.Name = customerName.
            Customer.CustId = id.
            
        end.

    end.
    
end.