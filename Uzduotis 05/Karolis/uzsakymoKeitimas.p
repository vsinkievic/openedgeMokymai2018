define variable iUzsakymoKodas as integer no-undo.

update iUzsakymoKodas 
    label "U�sakymo Numeris" 
    help "�veskite ie�komo uzsakymo numeri"
    with side-labels. 
    
     define frame fUpdate 
     Uzsakymas.Data Uzsakymas.KlientoKodas Uzsakymas.Suma 
     with side-labels 1 col.
     
find Uzsakymas exclusive-lock where Uzsakymas.UzsakymoNr = iUzsakymoKodas.
  if AVAILABLE Uzsakymas then update data klientokodas suma with frame fUpdate.
