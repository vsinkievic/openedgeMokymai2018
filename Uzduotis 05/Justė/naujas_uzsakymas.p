define variable tempKodas as character no-undo format "x(30)".
define variable i as integer no-undo init 3.

define frame fNaujas Uzsakymas.Nr skip Uzsakymas.Data skip 
                     Uzsakymas.Pavadinimas  skip Uzsakymas.Suma  skip 
                     Uzsakymas.Kodas  label "Kliento kodas" with 1 col title "Naujas uþsakymas" center.

naujas:
do while i <> 0:
    update tempkodas label "Kliento kodas" help "Áveskite kliento kodà.".
    find first Klientas where Klientas.Kodas = tempKodas no-error.
    if available Klientas then do transaction:
        create Uzsakymas.
        hide all.
        update Uzsakymas.Data help "Áveskite uþsakymo datà."
               Uzsakymas.Pavadinimas  help "Áveskite uþsakymo pavadinimà."
               Uzsakymas.Suma  help "Áveskite uþsakymo sumà."
               with 1 col center no-error.
       if error-status:error then do:
           message ("Neteisingai ávesti duomenys!") view-as alert-box.
           undo, leave.
       end.
       else do:
           assign Uzsakymas.Kodas = Klientas.Kodas.
           hide all.
           display Uzsakymas with frame fNaujas.
           leave naujas.
        end.
    end.
        
    else do:
        i = i - 1.
        message "Klientas su tokiu kodu neegzistuoja!~nLiko bandymø:" i view-as alert-box.
        if i = 0 then do:
           hide all.
           undo, leave.
        end.
    end.
end.
        