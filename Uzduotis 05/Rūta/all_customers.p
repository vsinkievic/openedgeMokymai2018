
for each Klientas no-lock 
    by Klientas.UzSuma descending:
    display Klientas.
    for each Uzsakymas where Klientas.Kodas = Uzsakymas.Kodas by Uzsakymas.Suma descending :
        display Uzsakymas.Numeris Uzsakymas.Pavadinimas Uzsakymas.Data Uzsakymas.Suma.
    end.
end.
