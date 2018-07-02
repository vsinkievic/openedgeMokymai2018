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