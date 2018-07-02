define variable orderId as integer no-undo.

update orderId label "U�sakymo nr." help "�veskite numer� u�sakymo, kur� nor�tum�te i�trinti" with side-labels.

deletion:
do transaction:

    find Orders where Orders.OrderNr = orderId exclusive-lock no-error.
    
    if available Orders then do:
        
        delete Orders.
        
    end.
    else do:
        
        message "Toks u�sakyma neegzistuoja" view-as alert-box.
        undo, leave deletion.
        
    end.
    
end.