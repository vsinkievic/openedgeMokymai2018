define frame esamiKlientai with centered title  "Informacija apie esamà klientà"  side-labels 2 col width 50 stream-io.

output to "ataskaita.txt".
for each klientas no-lock with frame esamiKlientai by uzsakymuSuma descending:
    display kodas label "ID" pavadinimas format "x(20)" label "Klientas" uzsakymuSuma label "Uþsakymø suma" uzsakymuKiekis label "Uþsakymø kiekis".
    
    if uzsakymusuma > 0 
    then do:
        for each uzsakymas no-lock
        where klientas.kodas = uzsakymas.kodas
        by uzsakymas.suma descending with title "Uþsakymø istorija" centered side-labels 2 col width 50 stream-io.
            display numeris label "Uþsakymo nr." pavadinimas format "x(20)" label "Apraðymas" suma label "Suma" kodas label "Kliento ID" data label "Uþsakymo data".
        end.
    end.
    else do:
            display "Klientas neturi uþsakymø" with side-labels 2 col width 50.
    end.
end.
output close.