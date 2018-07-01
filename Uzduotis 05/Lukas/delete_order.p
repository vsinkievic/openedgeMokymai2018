define variable orderId as integer no-undo.

update orderId label "Uþsakymo nr." help "Áveskite numerá uþsakymo, kurá norëtumëte iðtrinti" with side-labels.

deletion:
do transaction:

    find Orders EXCLUSIVE-LOCK where Orders.OrderNr = orderId  no-error.
    
    if available Orders then do:
        
        delete Orders.
        message "Uþsakymas iðtrintas" view-as alert-box.
        
    end.
    else do:
        
        message "Toks uþsakyma neegzistuoja" view-as alert-box.
        undo, leave deletion.
        
    end.
    
end.