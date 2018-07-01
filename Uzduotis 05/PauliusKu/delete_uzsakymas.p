define variable temp as integer no-undo.

update temp label "Užsakymo numeris." help "Įveskite užsakymo, kurį norite ištrinti, numerį.".
find first uzsakymas exclusive-lock where uzsakymas.numeris = temp no-error.
if available uzsakymas then do transaction:
    delete uzsakymas.
    message "Užsakymas ištrintas." view-as alert-box.
end.     
else do:
    message "Tokio užsakymo nėra!" view-as alert-box.
end.