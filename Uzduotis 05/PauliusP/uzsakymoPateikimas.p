define variable uzsakNr as integer no-undo.

do transaction with 2 col centered title "Naujo u�sakymo duomenys" width 40:
    create uzsakymas. 
        display numeris label "U�sakymo nr.". 
        update pavadinimas format "x(20)" label "Apra�ymas" suma label "Suma" kodas label "Kliento ID" data format "9999-99-99" label "Laikas".
end.