define variable kodas as integer no-undo.
define variable suma as decimal  no-undo.
 
 
 define frame ivedimas 
 kodas label "Áveskite kliento kodà"
 suma label "Áveskite uþsakymo sumà".
 
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
     message "Tokio kliento nëra" view-as alert-box.
     end. 