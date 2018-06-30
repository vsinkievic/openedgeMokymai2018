define variable iUzsakymoKodas as integer no-undo.
define variable pasirinkimas as logical no-undo.

update iUzsakymoKodas 
    label "Uþsakymo Numeris" 
    help "Áveskite ieðkomo uzsakymo numeri"
    with side-labels. 
    
    define frame fUpdate 
     Uzsakymas.UzsakymoNr Uzsakymas.Data 
     Uzsakymas.KlientoKodas Uzsakymas.Suma 
     with side-labels 1 col.
     
find Uzsakymas exclusive-lock where Uzsakymas.UzsakymoNr = iUzsakymoKodas.
  if AVAILABLE Uzsakymas then do: display uzsakymonr data klientokodas suma with frame fUpdate.
   update pasirinkimas label "Ar norite iðtrinti:".
     if pasirinkimas = true then do: delete Uzsakymas.
     message "Uþsakymas iðtrintas" view-as alert-box.
     end.
end.

