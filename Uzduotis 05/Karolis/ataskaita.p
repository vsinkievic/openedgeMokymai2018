


for each Klientas no-lock by Klientas.BendraUzsakymuSuma descending :
     display Klientas.KlientoKodas label "Kliento ID" Klientas.KlientoVardas label "Kliento vardas".
        for each Uzsakymas no-lock where Uzsakymas.KlientoKodas = Klientas.KlientoKodas:
            display Uzsakymas.Suma Uzsakymas.UzsakymoNr Uzsakymas.Data.
        end.
        display Klientas.BendraUzsakymuSuma label "Bendra suma" Klientas.BendrasUzsakymuKiekis label "Uzsakymu kiekis".
 end.