

for each klientas no-lock
    by klientas.bendra_uzsakymu_suma descending:
        display klientas
        with side-labels 1 col width 100.
        
        for each uzsakymas where klientas.pavadinimas = uzsakymas.pavadinimas 
        by uzsakymas.suma descending:
            display uzsakymas.numeris label "Uşsakymo numeris" 
            uzsakymas.pavadinimas  label "Kliento pavadinimas"
            uzsakymas.data  label "Uşsakymo data"
            uzsakymas.suma  label "Uşsakymo suma".
            end.
    end.        