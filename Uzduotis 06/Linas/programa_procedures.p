

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
        message "Klientas su tokiu kodu jau yra, áveskite ið naujo." 
            view-as alert-box.
        hide all.
        end.
    else do:
        create Customer.
        Customer.Id = id.
        Customer.Name = cName.
    end.
    hide frame kl-ivedimas.
end.


// DELETE CUSTOMER:
    
procedure delete_customer:
    
    define output parameter isOk as log init false no-undo.
    
    define variable isConfirmed as log no-undo init false.
    message "Ar tikrai norite iðtrinti" view-as alert-box question 
        buttons yes-no update isConfirmed.
    if isConfirmed then do transaction:
        find current Customer exclusive-lock.
        delete Customer.
        isOK = true.
    end.
end.


// ORDERS BY CUSTOMER:

procedure orders_by_customer:

    define input parameter id as integer no-undo.
    define variable orderId as integer no-undo.
    
    find Customer where Customer.Id = id no-lock.
    define query qOrd for Order scrolling.
    define browse bOrd query qOrd no-lock
        display Order.Id Order.Date Order.CustomerId Order.amount
        with 6 down no-assign expandable title "Uþsakymai".
    define frame fOrd
        skip (1) space (8) bOrd skip(1) space (8)
        with no-box width 150.
        
    on default-action of browse bOrd do:
        if available Order then do:
            run order_update.
            end.
    end.

    on "insert" of browse bOrd do:
        run order_create (input Customer.id).
        close query qOrd.
        open query qOrd for each Order no-lock where Order.CustomerId = Customer.Id.
        browse bOrd:refresh().
    end.
        
    on "delete" of browse bOrd do:
        run order_delete.
        close query qOrd.
        open query qOrd for each Order no-lock where Order.CustomerId = Customer.Id.
        browse bOrd:refresh().        
    end.
    
    on default-action of browse bOrd do:
        run order_update.
        close query qOrd.
        open query qOrd for each Order no-lock where Order.CustomerId = Customer.Id.
        browse bOrd:refresh().  
    end.
    
    define menu orderMenu menubar
        menu-item menu_order_create label "Naujas uþsakymas (ins)"
        menu-item menu_order_delete label "Iðtrinti uþsakymà (del)"
        menu-item menu_order_escape label "Gráþti (esc)".

    on choose of menu-item menu_order_create do:
        run order_create (input Customer.id).
        close query qOrd.
        open query qOrd for each Order no-lock where Order.CustomerId = Customer.Id.
        browse bOrd:refresh().
    end.
    on choose of menu-item menu_order_delete do:
        run order_delete.
        close query qOrd.
        open query qOrd for each Order no-lock where Order.CustomerId = Customer.Id.
        browse bOrd:refresh(). 
    end.
    on choose of menu-item menu_order_escape do:
        hide frame fOrd.
        quit.
    end.
    assign current-window:menubar = menu orderMenu:handle.

    
    open query qOrd for each Order where Order.CustomerId = Customer.Id.
    enable all with frame fOrd.
    display "Ins - naujas uþsakymas. Del - iðtrinti uþsakymà." skip
        "Enter - keisti uþsakymà. Ecs - gráþti".
    wait-for window-close of current-window.
end.



// ORDER UPDATE:

procedure order_update:
    
define variable id as integer no-undo.
define variable iCust as integer no-undo.
define variable dtDate as datetime no-undo.
define variable dcAmount as decimal no-undo.

    if not available Order then do:
        message "Tokio uþsakymo nëra" view-as alert-box.
        leave.
    end.
    else do:
    
    find current Order exclusive-lock no-error.
    
    iCust = Order.CustomerId.
    dcAmount = Order.Amount.
    update  iCust label "Uþsakovo kodas" 
            dcAmount label "Suma" 
            dtDate format "9999-99-99" label "Data"
            with 1 col width 100.
    find Customer where Customer.Id = iCust no-lock.
    if not available Customer then message "Tokio uþsakovo nëra" view-as alert-box.
    else do:
        Order.Date = dtDate.
        Order.CustomerId = iCust.
        Order.Amount = dcAmount.
    end.
    end.
end.



//ORDER DELETE:

procedure order_delete:

    find current Order exclusive-lock no-error.
    define variable isConfirmed as log no-undo init false.
    message "Ar tikrai norite iðtrinti uþsakymà Nr." Order.id "?" view-as alert-box question 
        buttons yes-no update isConfirmed.
    if isConfirmed then do:    
        delete Order.
        message "Uþsakymas iðtrintas".
    end.
end.


//ORDER CREATE:

procedure order_create:
    define input parameter id as integer no-undo.
    define variable dcAmount as decimal no-undo.
    define variable dDate as date no-undo.
    dDate = now.
    
    define frame uzs-ivedimas
        "Naujas uþsakymas" skip 
        dDate label "Data:" skip
        id label "Uþsakovo kodas:" skip
        dcAmount label "Suma:"
        with side-labels 1 col width 100.
   
    update id dcAmount
        with frame uzs-ivedimas.  
    
    find Customer where Customer.Id = id no-lock no-error.
    if not available Customer then do:
        message "Tokio uþsakovo nëra!" view-as alert-box.
        hide all.
        run order_create (0).
    end.
    else do:
        create Order.
        Order.Amount = dcAmount.
        Order.CustomerId = id.
    end.
    hide frame uzs-ivedimas.
end.


/*procedure order_refresh:                                                        */
/*    close query qOrd.                                                           */
/*    open query qOrd for each Order no-lock where Order.CustomerId = Customer.Id.*/
/*    browse bOrd:refresh().                                                      */
/*end.                                                                            */


