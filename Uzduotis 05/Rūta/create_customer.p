
define variable custName as character no-undo.
define variable custNum as integer no-undo.

update custNum label "Kliento kodas" help "Iveskite kliento koda!" 
       custName label "Kliento vardas" help "Iveskite kliento varda!".

find Klientas where Klientas.Kodas = custNum no-error.
if available Klientas then message "Toks klientas jau egzistuoja." view-as alert-box error.
else do:
    create Klientas.
    Klientas.Kodas = custNum.
    Klientas.Vardas = custName.
end.
