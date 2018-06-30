define variable tempNr as integer no-undo.
define variable i as integer no-undo init 3.

trynimas:
do while i <> 0:
    update tempNr label "U�sakymo nr." help "�veskite trinamo u�sakymo numer�.".
    find first Uzsakymas where Uzsakymas.Nr = tempNr no-error.
    if available Uzsakymas then do transaction:
        delete Uzsakymas.
        message "U�sakymas i�trintas." view-as alert-box.
        leave trynimas.
    end.     
    else do:
        i = i - 1.
        message "Toks u�sakymas neegzistuoja!~nLiko bandym�:" i view-as alert-box.
        if i = 0 then do:
           hide all.
           undo, leave.
        end.
    end.
end.