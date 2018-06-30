define variable uzsakymoNumerioKeitimas as integer no-undo.

update uzsakymoNumerioKeitimas label "Norimo pa�alinti u�sakymo numeris" with side-labels.

find uzsakymas exclusive-lock where uzsakymas.numeris = uzsakymoNumerioKeitimas no-error.
if available uzsakymas 
    then do:
            DELETE uzsakymas.
            message "Pasirinktas u�sakymas pa�alintas i� sistemos" view-as alert-box title "Sistemos prane�imas".
    end.
if not available uzsakymas
    then do:
            message "Tokio u�sakymo n�ra" view-as alert-box title "Sistemos prane�imas".
    end.