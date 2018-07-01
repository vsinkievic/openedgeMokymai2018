define variable tempkodas as integer no-undo.

define frame frame2 uzsakymas.numeris label "Numeris" skip uzsakymas.data label "Data" skip 
     uzsakymas.pavadinimas label "Pavadinimas" skip uzsakymas.kaina label "Kaina" skip 
     uzsakymas.kodas  label "Kliento kodas" with 1 col title "Naujas užsakymas" center.


do transaction:
    
    update tempkodas label "Kliento kodas" help "Įveskite kliento kodą.".
    find first klientas where klientas.kodas = tempkodas no-error.
    
    if available klientas then do transaction:
        create uzsakymas.
        hide all.
        
        update uzsakymas.data help "Įveskite užsakymo datą."
           uzsakymas.pavadinimas  help "Įveskite užsakymo pavadinimą."
           uzsakymas.kaina  help "Įveskite užsakymo sumą."
           with 1 col center no-error.
        if error-status:error then do:
           message ("Duomenys įvesti neteisingai!") view-as alert-box.
           undo, leave.
           
       end.
       else do:
           assign uzsakymas.kodas = klientas.Kodas.
           hide all.
           display uzsakymas with frame frame2.
       end. 
    end.
    else do:
        message "Toks klientas neegzistuoja!" view-as alert-box.
        undo.
            
    end.
end.    