

for each klientas no-lock
    by klientas.bendra_uzsakymu_suma descending:
        display klientas
        with side-labels 1 col width 100.
        
        for each uzsakymas where klientas.pavadinimas = uzsakymas.pavadinimas 
        by uzsakymas.suma descending:
            display uzsakymas.numeris label "U�sakymo numeris" 
            uzsakymas.pavadinimas  label "Kliento pavadinimas"
            uzsakymas.data  label "U�sakymo data"
            uzsakymas.suma  label "U�sakymo suma".
        end.
end.        