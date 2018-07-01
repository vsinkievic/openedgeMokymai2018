define variable kodas as integer no-undo.
define variable suma as decimal  no-undo.
 
 
 define frame ivedimas 
 kodas label "�veskite kliento kod�"
 suma label "�veskite u�sakymo sum�".
 
 update kodas suma
 with frame ivedimas.
 
 find klientas where klientas.kodas = kodas no-lock no-error.
 if available klientas
 then do:
     create uzsakymas.
     uzsakymas.pavadinimas = klientas.pavadinimas.
     uzsakymas.suma = suma.
     uzsakymas.data = now.
     end.
 else do:
     message "Tokio kliento n�ra" view-as alert-box.
     end. 