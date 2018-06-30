define variable iUzsakymoKodas as integer no-undo.
define variable pasirinkimas as logical no-undo.

update iUzsakymoKodas 
    label "U�sakymo Numeris" 
    help "�veskite ie�komo uzsakymo numeri"
    with side-labels. 
    
    define frame fUpdate 
     Uzsakymas.UzsakymoNr Uzsakymas.Data 
     Uzsakymas.KlientoKodas Uzsakymas.Suma 
     with side-labels 1 col.
     
find Uzsakymas exclusive-lock where Uzsakymas.UzsakymoNr = iUzsakymoKodas.
  if AVAILABLE Uzsakymas then do: display uzsakymonr data klientokodas suma with frame fUpdate.
   update pasirinkimas label "Ar norite i�trinti:".
     if pasirinkimas = true then do: delete Uzsakymas.
     message "U�sakymas i�trintas" view-as alert-box.
     end.
end.

