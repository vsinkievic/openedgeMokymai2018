define variable uzsakymoNumerioKeitimas as integer no-undo.

update uzsakymoNumerioKeitimas label "Norimo paðalinti uþsakymo numeris" with side-labels.

find uzsakymas exclusive-lock where uzsakymas.numeris = uzsakymoNumerioKeitimas no-error.
if available uzsakymas 
    then do:
            DELETE uzsakymas.
            message "Pasirinktas uþsakymas paðalintas ið sistemos" view-as alert-box title "Sistemos praneðimas".
    end.
if not available uzsakymas
    then do:
            message "Tokio uþsakymo nëra" view-as alert-box title "Sistemos praneðimas".
    end.