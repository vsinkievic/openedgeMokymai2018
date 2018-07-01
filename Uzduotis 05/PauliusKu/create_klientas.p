
define variable temp-kodas as integer no-undo.

define frame frame1 temp-kodas label "Kodas" skip
    klientas.pavadinimas label "Pavadinimas"
    with 1 col title "Naujas Klientas" center.
define frame frame2 Klientas.Kodas label "Kodas" skip klientas.pavadinimas label "Pavadinimas" skip
    Klientas.Uzsakymu_kiekis label "Užs. kiekis" skip Klientas.suma label "Suma"
    with 1 col title "Naujas Klientas" center.


do transaction:
    create klientas.
    update temp-kodas klientas.pavadinimas with frame frame1 no-error.
    if can-find (first klientas where klientas.kodas = temp-kodas)
        then do:
             message "Toks klieto kodas jau yra. Bandykite įvesti dar kartą" view-as alert-box.
             undo.
         end.
    else do:
         assign klientas.kodas = temp-kodas.
         hide frame frame1.
         display Klientas with frame frame2.
    end.
end.