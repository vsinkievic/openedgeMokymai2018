
define variable custNum as integer no-undo.

update custNum label "Kliento kodas" help "Iveskite kliento koda!".
find first Klientas where Klientas.Kodas = custNum no-error.
if not available Klientas then message "Toks klientas neegzistuoja." view-as alert-box error.
else do transaction:
    create Uzsakymas.
    update Uzsakymas.Pavadinimas help "Iveskite uzsakymo pavadinima!" 
           Uzsakymas.Data help "Iveskite uzsakymo data!"
           Uzsakymas.Suma  help "Iveskite uzsakymo suma!".
    Uzsakymas.Kodas = Klientas.Kodas.
    display Uzsakymas.Numeris Uzsakymas.Data Uzsakymas.Pavadinimas Uzsakymas.Suma.
end.