define frame esamiKlientai with centered title  "Informacija apie esam� klient�"  side-labels 2 col width 50 stream-io.

output to "ataskaita.txt".
for each klientas no-lock with frame esamiKlientai by uzsakymuSuma descending:
    display kodas label "ID" pavadinimas format "x(20)" label "Klientas" uzsakymuSuma label "U�sakym� suma" uzsakymuKiekis label "U�sakym� kiekis".
    
    if uzsakymusuma > 0 
    then do:
        for each uzsakymas no-lock
        where klientas.kodas = uzsakymas.kodas
        by uzsakymas.suma descending with title "U�sakym� istorija" centered side-labels 2 col width 50 stream-io.
            display numeris label "U�sakymo nr." pavadinimas format "x(20)" label "Apra�ymas" suma label "Suma" kodas label "Kliento ID" data label "U�sakymo data".
        end.
    end.
    else do:
            display "Klientas neturi u�sakym�" with side-labels 2 col width 50.
    end.
end.
output close.