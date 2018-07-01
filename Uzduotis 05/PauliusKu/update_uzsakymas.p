define variable temp as integer no-undo.

define frame frameN uzsakymas.numeris skip uzsakymas.data skip 
                      uzsakymas.pavadinimas skip uzsakymas.kaina skip 
                      uzsakymas.kodas label "Kliento kodas" with 1 col title "Pkaeistas užsakymas" center.

update temp label "Užsakymo numeris." help "Įveskite užsakymo, kurį norite pakeisti, numerį.".
find first uzsakymas exclusive-lock where uzsakymas.numeris = temp no-error.
if available uzsakymas then do transaction:
    update uzsakymas.data help "Įveskite data."
       uzsakymas.pavadinimas  help "Įveskite pavadinimą."
       uzsakymas.kaina  help "Įveskite sumą."
       with 1 col center no-error.
   if error-status:error then do:
       message ("Duomenys įvesti neteisingai!") view-as alert-box.
       undo, leave.
   end.
   else do:
       hide all.
       display Uzsakymas with frame frameN.
    end.
end.     
else do:
    message "Tokio užsakymo nėra!" view-as alert-box.
end.