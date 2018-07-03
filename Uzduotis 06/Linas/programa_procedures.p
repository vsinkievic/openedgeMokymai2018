//MAIN WINDOW:

procedure customers_browse:
    
    define query qCust for Customer scrolling.
    define browse bCust query qCust no-lock 
        display Customer.Id Customer.Name Customer.OrdersCount 
        Customer.OrdersTotal 
        with 15 down no-assign expandable title "Klientai".
    
    define button buttonCustCreate label "Naujas U�sakovas".
    define button buttonNewOrder label "Naujas u�sakymas".
    define button buttonLeave label "Baigti darb�" auto-endkey.
   
    define frame fCust 
        buttonCustCreate buttonNewOrder buttonLeave 
        skip (1) space (8) bCust skip(1) space (8) buttonCustCreate
        with no-box width 300.
        
    on default-action of browse bCust do:
        hide all.
        run orders_by_customer (input Customer.id).
    end.
        
    on choose of buttonCustCreate do:
        hide all.
        run create_customer.
    end.
    
    on choose of buttonLeave do:
        hide all.
        quit.
    end.
    
    on choose of buttonNewOrder do:
        hide all.
        run order_create (input Customer.id).
    end.
                
    open query qCust for each Customer.
    enable all with frame fCust.
    apply "value-changed" to browse bCust.
    wait-for window-close of current-window.
    
end.


//CREATE CUSTOMER:

procedure create_customer:

    define variable id as integer no-undo.
    define variable cName as character no-undo.
    
    define frame kl-ivedimas
        id label "Kodas" skip 
        cName label "Pavadinimas" format "x(64)"
        with side-labels 1 col width 100.
    
    update id cName 
        with frame kl-ivedimas.  
    
    find Customer where Customer.id = id no-lock no-error.
    if available Customer then do:
        message "Klientas su tokiu kodu jau yra, �veskite i� naujo." 
            view-as alert-box.
        hide all.
        run customers_browse.
        end.
    else do:
        create Customer.
        Customer.Id = id.
        Customer.Name = cName.
    end.
    hide all.
    run customers_browse.
end.





// ORDERS BY CUSTOMER:

procedure orders_by_customer:

    define input parameter id as integer no-undo.
    define variable orderId as integer no-undo.
    
    find Customer where Customer.Id = id no-lock.
    
/*    define menu orderMenu menubar                                  */
/*        menu-item menu_order_create label "Naujas u�sakymas (ins)" */
/*        menu-item menu_order_delete label "I�trinti u�sakym� (del)"*/
/*        menu-item menu_order_escape label "Gr��ti (esc)".          */
/*                                                                   */
/*    on choose of menu-item menu_order_create do:                   */
/*        run order_create (input 0).                                */
/*        end.                                                       */
/*    on choose of menu-item menu_order_delete                       */
/*        run order_delete (input 0).                                */
/*    on choose of menu-item menu_order_escape do:                   */
/*        hide all.                                                  */
/*        run customers_browse.                                      */
/*    end.                                                           */
/*    assign current-window:menubar = menu orderMenu:handle.         */
    
    
    define query qOrd for Order scrolling.
    define browse bOrd query qOrd no-lock
        display Order.Id Order.Date Order.CustomerId Order.amount
        with 6 down no-assign expandable title "U�sakymai".
    define frame fOrd
        skip (1) space (8) bOrd skip(1) space (8)
        with no-box width 150.
        
    on default-action of browse bOrd do:
        if available Order then do:
            run order_update.
            end.
    end.
 
    listener:
    repeat:
        open query qOrd for each Order where Order.CustomerId = Customer.Id.
        enable all with frame fOrd.
        display "Ins - naujas u�sakymas. Del - i�trinti u�sakym�." skip 
        "Enter - keisti u�sakym�. Ecs - gr��ti".
        
        if can-find(first Order where Order.CustomerId = Customer.Id) then do:
            find current Order no-lock.
            end.
        else orderId = 0.
        
        readkey.
        if lastkey = 127 then run order_delete (input orderId).
        if lastkey = 510 then run order_create (input Customer.id).
        if lastkey = 13 then run order_update.
        if lastkey = 27 then do:
            hide all.
            leave listener.
            end.
    end.
    hide all.
    run customers_browse.
    
end.


// ORDER UPDATE:

procedure order_update:
    
define variable id as integer no-undo.
define variable iCust as integer no-undo.
define variable dtDate as datetime no-undo.
define variable dcAmount as decimal no-undo.

define frame fUzs-keitimas 
     id label "U�sakymo numeris" dtDate label "Data" skip
     iCust label "U�sakovo kodas:" skip
     dcAmount label "Suma"
     with side-labels 1 col width 150.

define frame uzs-apzvalga
    Order.Id skip
    Order.Date skip
    Order.Customerid Customer.Name skip
    Order.amount
    with side-labels 1 col width 100.


    if not available Order then do:
        message "Tokio u�sakymo n�ra" view-as alert-box.
        hide all.
        run customers_browse.
    end.
    else do:
    
        find current Order exclusive-lock no-error.
        
        find Customer where Customer.Id = Order.CustomerId.
        iCust = Order.CustomerId.
        dcAmount = Order.Amount.
        update  iCust label "U�sakovo kodas" 
                dcAmount label "Suma" 
                dtDate format "9999-99-99" label "Data"
                with 1 col width 100.
        find Customer where Customer.Id = iCust no-lock.
        if not available Customer then message "Tokio u�sakovo n�ra" view-as alert-box.
        else do:
            Order.Date = dtDate.
            Order.CustomerId = iCust.
            Order.Amount = dcAmount.
            display Order.Id Order.Date Order.CustomerId Customer.Name Order.Amount
            with frame uzs-apzvalga.
        end.
        hide all.
        run orders_by_customer (iCust).
    end.
end.



//ORDER DELETE:

procedure order_delete:

    define input parameter iOrdNum as integer no-undo.
    define variable id as integer no-undo.
    
    update iOrdNum 
       label "U�sakymo numeris" 
       help "�veskite u�sakymo numer�"
       with side-labels. 
    
    find current Customer no-lock.
    id = Customer.Id.
    
    find Order exclusive-lock where Order.id = iOrdNum no-error. 
    if not available Order then 
        message "Tokio u�sakymo n�ra".
    else do:
        delete Order.
        message "U�sakymas" iOrdNum "i�trintas".
    end.
    hide all.
    run orders_by_customer (id).
end.


//ORDER CREATE:


procedure order_create:
    
    define input parameter id as integer no-undo.
    define variable dcAmount as decimal no-undo.
    
    define frame uzs-ivedimas
        id label "U�sakovo kodas:" skip
        dcAmount label "Suma:"
        with side-labels 1 col width 100.
    
    define frame uzs-apzvalga
        Order.Id skip
        Order.Date skip
        Order.Customerid Customer.Name skip
        Order.amount
        with side-labels 1 col width 100.
    
    display "Naujas u�sakymas" skip with stream-io.
    display "Data: " now format "9999-99-99" skip with stream-io.
    
    update id dcAmount
        with frame uzs-ivedimas.  
    
    find Customer where Customer.Id = id no-lock no-error.
    if not available Customer then do:
        message "Tokio u�sakovo n�ra!" view-as alert-box.
        hide all.
        run order_create (0).
    end.
    else do:
        create Order.
        Order.Amount = dcAmount.
        Order.CustomerId = id.
        display Order.Id Order.Date Order.CustomerId Customer.Name Order.Amount
            with frame uzs-apzvalga.
    end.
    hide all.
    run orders_by_customer (id).
    
end.





