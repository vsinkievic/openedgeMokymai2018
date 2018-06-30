define frame naujamKlientui with centered title  "Naujo kliento ávedimo programa".
define variable uzklausa as log no-undo init true.

do while uzklausa <> false:
    do transaction:
        create klientas.
        update kodas label "ID" klientas.pavadinimas format "x(20)" label "Klientas" with frame naujamKlientui. 
    end.
    update uzklausa label "Jûsø pasirinkimas" with centered title "Ávesti dar vienà klientà?".
end.