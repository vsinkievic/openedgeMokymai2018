// Starting procedure
run prc_customerTble.

//Displays customer table
procedure prc_customerTble:

    define query qr_custQuery for Customer scrolling.
    
    define button btn_addCustomer label "Sukurti naujà klieto áraðà".
              
    define browse br_browseCustomers query qr_custQuery share-lock
        display 
        Customer.CustId label "ID" 
        Customer.Name label "Customer name" width 30
        Customer.TotalOrders label "Order amount" width 11
        Customer.OrderTotal label "Order total"
        with 10 down title "Customer list" separators.
        
    define frame fr_browseCustomers
        br_browseCustomers skip(1)
        btn_addCustomer.
    
    on DEFAULT-ACTION of browse br_browseCustomers do:
        run prc_displayOrders(input-output Customer.CustId).
    end.
    
    on choose of btn_addCustomer run prc_createCustomer.
        
    open query qr_custQuery for each Customer.
    enable all with frame fr_browseCustomers.
    apply "value-changed" to browse br_browseCustomers.
    wait-for window-close of current-window.
    
end.

//Displays orders of the selected customer
procedure prc_displayOrders:
    
    define input-output parameter id as integer no-undo.
    
    define query qr_orderQuery for Orders scrolling.
    
    define button btn_editOrders label "Modifikuoti uþsakymà".
    
    define browse br_browseOrders query qr_orderQuery share-lock
        display 
            Orders.OrderNr
            Orders.OrderName width 20
            Orders.OrderAmount
            Orders.OrderDate
            with 10 down title "Customer list" separators.

    define frame fr_displayOrders
        br_browseOrders skip(1)
        btn_editOrders.

    open query qr_orderQuery for each Orders where Orders.CustId = id.    
    enable all with frame fr_displayOrders.
    
    on choose of btn_editOrders run prc_editOrders.
    
    readkey.
    if lastkey = 510 then run prc_createOrders.
    if lastkey = 512 then run prc_deleteOrders.
    
    wait-for window-close of current-window.

end.

//Editing orders
procedure prc_editOrders:
    
    define variable orderId as integer no-undo.
    define variable cOrderName as character format "x(50)" no-undo.
    define variable dOrderAmount as decimal format ">>>,>>>,>>>,>>9.99" no-undo.
    define variable id as integer no-undo.
    define variable oldId as integer no-undo.
    
    define frame newOrderFr
        Orders.CustId label "Kliento ID"
        Orders.OrderName label "Uþsakymo pavadinimas"
        Orders.OrderAmount label "Uþsakymo suma"
        id label "Kliento ID" help "Áveskite kliento ID" 
        cOrderName label "Uþsakymo pavadinimas" help "Áveskite trumpà uþsakymo apraðà"
        dOrderAmount label "Uþsakymo suma" help "Áveskite sumà, kurià klientas turi apmokëti uþ uþsakymà"
        with side-labels 1 col.
        
    update orderId label "Uþsakymo nr." help "Áveskite nr. uþsakymom kurá norëtumëte modifikuoti" with side-labels.
    
    editing_order:
    do transaction:
    
        find Orders where Orders.OrderNr = orderId exclusive-lock no-error.
        
        if AVAILABLE Orders then do:
            
            display Orders.CustId Orders.OrderName Orders.OrderAmount with frame newOrderFr.
            update id cOrderName dOrderAmount with frame newOrderFr.
            
            find Customer where Customer.CustId = id exclusive-lock no-error.
            
            if available Customer then do:
                
                Orders.CustId = id.
                Orders.OrderName = cOrderName.
                Orders.OrderAmount = dOrderAmount.
                
            end.
            else do:
                
                message "Klientas su tokiu ID neegzistuoja" view-as alert-box.
                undo, leave editing_order.
                
            end.
            
        end.
        else do:
            
            message "Toks uþsakymas neegzistuoja" view-as alert-box.
            undo, leave editing_order.
            
        end.
    
    end.
    
end.

//Deleting orders
procedure prc_deleteOrders:
    
    define variable orderId as integer no-undo.
    
    update orderId label "Uþsakymo nr." help "Áveskite numerá uþsakymo, kurá norëtumëte iðtrinti" with side-labels.
    
    deletion:
    do transaction:
    
        find Orders where Orders.OrderNr = orderId exclusive-lock no-error.
        
        if available Orders then do:
            
            delete Orders.
            
        end.
        else do:
            
            message "Toks uþsakyma neegzistuoja" view-as alert-box.
            undo, leave deletion.
            
        end.
        
    end.
    
end.

//Create customer
procedure prc_createCustomer:
    
    define variable id as integer no-undo.
    define variable customerName as character format "x(50)" no-undo.
    
    define frame creationFr
        id label "Kliento kodas" help "Áveskite kliento kodà"
        customerName label "Kliento pavadinimas" help "Áveskite kliento pavadinimà" 
        with side-labels.
        
    update id customerName with frame creationFr.
        
    creation:    
    do transaction:                                                                    
        
        find Customer where Customer.CustId = id no-lock no-error.
    
        if available Customer then do:
            message "Klientas su tokiu kodu jau egzsituoja" view-as alert-box.
            undo, leave creation.
        end.
        else do:
            
            find Customer where Customer.Name = customerName no-lock no-error.
            
            if available Customer then do:
                message "Klientas su tokiu pavadinimu jau egzsituoja" view-as alert-box.
                undo, leave creation.
            end.
            else do:
    
                create Customer.
                Customer.Name = customerName.
                Customer.CustId = id.
                
            end.
    
        end.
        
    end.
    
end.

//creating orders
procedure prc_createOrders:

    define variable cOrderName as character format "x(50)" no-undo.
    define variable dOrderAmount as decimal format ">>>,>>>,>>>,>>9.99" no-undo.
    define variable id as integer no-undo.
    
    define frame orderFr
        id label "Kliento ID" help "Áveskite kliento ID"
        cOrderName label "Uþsakymo pavadinimas" help "Áveskite trumpà uþsakymo apraðà"
        dOrderAmount label "Uþsakymo suma" help "Áveskite sumà, kurià klientas turi apmokëti uþ uþsakymà"
        with side-labels.
        
    update id cOrderName dOrderAmount with frame orderFr.
    
    order_creation:
    do transaction:
    
        find Customer where Customer.CustId = id exclusive-lock no-error.
        
        if available Customer then do:
            
            create Orders.
            Orders.CustId = id.
            Orders.OrderName = cOrderName.
            Orders.OrderAmount = dOrderAmount.
            Customer.TotalOrders = Customer.TotalOrders + 1.
            Customer.OrderTotal = Customer.OrderTotal + dOrderAmount.
            
            
        end.
        else do:
            
            message "Klientas su tokiu ID neegzistuoja" view-as alert-box.
            undo, leave order_creation.
            
        end.
        
    end.

end.