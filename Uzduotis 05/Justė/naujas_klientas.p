define variable tempKodas as character no-undo format "x(30)".
define var i as integer no-undo init 3. 

define frame fSenas tempKodas skip Klientas.Pavadinimas with 1 col center.
                    
define frame fNaujas Klientas.Kodas skip Klientas.Pavadinimas skip 
                     Klientas.UzsakymuKiekis skip Klientas.UzsakymuSuma
                     with 1 col title "Naujas Klientas" center.

do transaction:
    create Klientas.
    do while i <> 0:
        update tempKodas label "Kodas" help "Áveskite kliento kodà."
               Klientas.Pavadinimas help "Áveskite kliento pavadinimà."
               with frame fSenas no-error.
        if can-find (first Klientas where Klientas.Kodas = tempKodas) or tempKodas = ""
        then do:
             i = i - 1.
             message "Klientas su tokiu kodu jau egzistuoja!~nLiko bandymø:" i view-as alert-box.
             if i = 0 then do:
                 hide frame fSenas.
                 undo, leave.
            end.
         end.
         else do:
             assign Klientas.Kodas = tempKodas.
             hide frame fSenas.
             display Klientas with frame fNaujas.
             leave.
         end.
     end.
end.
