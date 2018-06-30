define variable tempNr as integer no-undo.
define variable i as integer no-undo init 3.

define frame fKeistas Uzsakymas.Nr skip Uzsakymas.Data skip 
                      Uzsakymas.Pavadinimas skip Uzsakymas.Suma skip 
                      Uzsakymas.Kodas label "Kliento kodas" with 1 col title "Pakeistas uþsakymas" center.

keitimas:
do while i <> 0:
    update tempNr label "Uþsakymo nr." help "Iveskite keièiamo uþsakymo numerá.".
    find first Uzsakymas exclusive-lock where Uzsakymas.Nr = tempNr no-error.
    if available Uzsakymas then do transaction:
        update Uzsakymas.Data help "Áveskite uþsakymo datà."
               Uzsakymas.Pavadinimas  help "Áveskite uþsakymo pavadinimà."
               Uzsakymas.Suma  help "Áveskite uþsakymo sumà."
               with 1 col center no-error.
       if error-status:error then do:
           message ("Neteisingai ávesti duomenys!") view-as alert-box.
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
        message "Toks uþsakymas neegzistuoja!~nLiko bandymø:" i view-as alert-box.
        if i = 0 then do:
           hide all.
           undo, leave.
        end.
    end.
end.
        