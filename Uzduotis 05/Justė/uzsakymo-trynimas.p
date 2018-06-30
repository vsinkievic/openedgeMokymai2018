define variable tempNr as integer no-undo.
define variable i as integer no-undo init 3.

trynimas:
do while i <> 0:
    update tempNr label "Uþsakymo nr." help "Áveskite trinamo uþsakymo numerá.".
    find first Uzsakymas exclusive-lock where Uzsakymas.Nr = tempNr no-error.
    if available Uzsakymas then do transaction:
        delete Uzsakymas.
        message "Uþsakymas iðtrintas." view-as alert-box.
        leave trynimas.
    end.     
    else do:
        i = i - 1.
        message "Toks uþsakymas neegzistuoja!~nLiko bandymø:" i view-as alert-box.
        if i = 0 then do:
           hide all.
           undo, leave.
        end.
    end.
end.