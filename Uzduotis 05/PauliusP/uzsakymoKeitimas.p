define variable uzsakymoNumerioKeitimas as integer no-undo.
define frame keitimas with centered title  "Uþsakymo informacija"  side-labels 2 col width 50.

update uzsakymoNumerioKeitimas label "Norimo pakeisti uþsakymo numeris" with centered side-labels.
find uzsakymas exclusive-lock where uzsakymas.numeris = uzsakymoNumerioKeitimas no-error.
    if available uzsakymas 
    then do with frame keitimas:
        update pavadinimas format "x(20)" label "Apraðymas" suma label "Suma" kodas label "Kliento ID" data format "9999-99-99" label "Laikas".
        message "Duomenys teisingi, uþsakymo informacija atnaujinta" view-as alert-box title "Sistemos praneðimas".
    end.
    if not available uzsakymas
    then do:
        message "Tokio uþsakymo nëra" view-as alert-box title "Sistemos praneðimas".
    end.
