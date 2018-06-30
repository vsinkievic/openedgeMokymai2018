define variable tempNr as integer no-undo.
define variable i as integer no-undo init 3.

define frame fKeistas Uzsakymas.Nr skip Uzsakymas.Data skip 
                      Uzsakymas.Pavadinimas skip Uzsakymas.Suma skip 
                      Uzsakymas.Kodas label "Kliento kodas" with 1 col title "Pakeistas u�sakymas" center.

keitimas:
do while i <> 0:
    update tempNr label "U�sakymo nr." help "Iveskite kei�iamo u�sakymo numer�.".
    find first Uzsakymas exclusive-lock where Uzsakymas.Nr = tempNr no-error.
    if available Uzsakymas then do transaction:
        update Uzsakymas.Data help "�veskite u�sakymo dat�."
               Uzsakymas.Pavadinimas  help "�veskite u�sakymo pavadinim�."
               Uzsakymas.Suma  help "�veskite u�sakymo sum�."
               with 1 col center no-error.
       if error-status:error then do:
           message ("Neteisingai �vesti duomenys!") view-as alert-box.
           undo, leave.
       end.
       else do:
           hide all.
           display Uzsakymas with frame fKeistas.
           leave keitimas.
        end.
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
        