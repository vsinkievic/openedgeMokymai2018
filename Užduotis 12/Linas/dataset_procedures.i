
procedure orders_by_customer:

    define input parameter id as integer no-undo.
    define variable orderId as integer no-undo.
    
    find ttCustomer where ttCustomer.Cust-Num = id.
    define query qOrd for ttOrder scrolling.
    define browse bOrd query qOrd
        display ttOrder.Order-num ttOrder.Order-Date ttOrder.Cust-num ttOrder.Instructions
        with 6 down no-assign expandable title "Orders".
    define frame fOrd
        skip (1) space (8) bOrd skip(1) space (8)
        with no-box width 150.
        
    on "insert" of browse bOrd do:
        run createOrder (input ttCustomer.Cust-Num).
        close query qOrd.
        open query qOrd for each ttOrder where ttOrder.Cust-num = ttCustomer.Cust-num.
        browse bOrd:refresh().
    end.
        
    on "delete" of browse bOrd do:
        run deleteOrder(input ttOrder.Order-Num).
        close query qOrd.
        open query qOrd for each ttOrder where ttOrder.Cust-num = ttCustomer.cust-num.
        browse bOrd:refresh().        
    end.
    
    on default-action of browse bOrd do:
        run updateOrder(input ttOrder.Order-num).
        close query qOrd.
        open query qOrd for each ttOrder where ttOrder.Cust-num = ttCustomer.cust-num.
        browse bOrd:refresh().  
    end.
    
    define menu orderMenu menubar
        menu-item menu_order_create label "New order (ins)"
        menu-item menu_order_delete label "Delete Order (del)"
        menu-item menu_order_escape label "Return (esc)".

    on choose of menu-item menu_order_create do:
        run createOrder (input ttCustomer.cust-num).
        close query qOrd.
        open query qOrd for each ttOrder where ttOrder.cust-num = ttCustomer.cust-num.
        browse bOrd:refresh().
    end.
    on choose of menu-item menu_order_delete do:
        run deleteOrder (input ttOrder.Order-num).
        close query qOrd.
        open query qOrd for each ttOrder where ttOrder.cust-num = ttCustomer.cust-num.
        browse bOrd:refresh(). 
    end.
    on choose of menu-item menu_order_escape do:
        hide frame fOrd.
        leave.
    end.
    assign current-window:menubar = menu orderMenu:handle.

    
    open query qOrd for each ttOrder where ttOrder.cust-num = ttCustomer.cust-num.
    enable all with frame fOrd.
    display "Ins - new order. Del - delete order." skip
        "Enter - update order. Ecs - return".
    wait-for window-close of current-window.
end.




procedure createOrder:
    temp-table ttOrder:tracking-changes = true.
    define input parameter id as integer.
    find ttCustomer where ttCustomer.Cust-num = id.
    if available ttCustomer then do:
        find last ttOrder.
        order_id = ttOrder.Order-num + 1.
        create ttOrder.
            ttOrder.Order-num = order_id.
            ttOrder.Cust-Num = ttCustomer.Cust-Num.
            ttOrder.Order-Date = now.
            update ttOrder.Instructions label "Order Instructions".
        end.
    temp-table ttOrder:tracking-changes = false.
end.

procedure updateOrder:
    temp-table ttOrder:tracking-changes = true.
    define input parameter id as integer.
    find ttOrder where ttOrder.Order-num = id.
    if available ttOrder then
        update ttOrder.Order-Date ttOrder.Cust-Num ttOrder.Instructions.
    temp-table ttOrder:tracking-changes = false.
end.
    
procedure deleteOrder:
    temp-table ttOrder:tracking-changes = true.
    define input parameter id as integer.
    find ttOrder where ttOrder.Order-num = id.
    if available ttOrder then do:
        message "Do you really want to delete order No. " ttOrder.Order-num " ?"
            view-as alert-box buttons yes-no update lAnswer.
            if lAnswer then do:
                delete ttOrder.
                message "Order deleted" view-as alert-box.
            end.
    end.
    temp-table ttOrder:tracking-changes = false.
end.


procedure showChanges:
    
    dataset dsPakeitimai:get-changes(dataset dsDuomenys:handle).
    define button xmlButton label "Export to xml".
    define frame fChanges xmlButton skip 
        pttOrder.Order-num pttOrder.Order-Date pttOrder.Cust-num pttOrder.Instructions skip
        with row 10 width 80 title "Changes made during this session" use-text.
    enable all with frame fChanges.
    on choose of xmlButton do:
        dataset dsPakeitimai:write-xml ("file", "pakeitimai.xml", true, "utf-8", ?, no, yes, yes).
        message "Changes exported to xml" view-as alert-box.
    end.
    
    for each pttOrder with frame fChanges:
        display skip pttOrder.Order-num pttOrder.Order-Date pttOrder.Cust-num 
            pttOrder.Instructions skip.
    end.
    wait-for window-close of current-window.

end.
    