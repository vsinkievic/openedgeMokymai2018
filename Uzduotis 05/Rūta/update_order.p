
define variable iOrderNum as integer no-undo.

update iOrderNum 
    label "Uzsakymo numeris" 
    help "Iveskite ieskomo uzsakymo numeri."
    with side-labels 1 col. 
message iOrderNum.

find first Uzsakymas where Uzsakymas.Numeris = iOrderNum no-error.
if not available Uzsakymas then message "Toks uzsakymas neegzistuoja." view-as alert-box error. 
else do transaction:
    display Uzsakymas.Data Uzsakymas.Pavadinimas Uzsakymas.Suma. 
    update Uzsakymas.Data help "Iveskite uzsakymo data."
           Uzsakymas.Pavadinimas help "Iveskite uzsakymo pavadinima."
           Uzsakymas.Suma help "Iveskite uzsakymo suma.".
end.