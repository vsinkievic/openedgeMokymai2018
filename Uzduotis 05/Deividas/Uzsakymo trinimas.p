define variable numeris as integer no-undo.

define frame ivedimas
numeris label "�vesktie u�sakymo numeri kur� norite trinti".

update numeris
with frame ivedimas.

find uzsakymas where uzsakymas.numeris = numeris.
    if not available uzsakymas then message "Tokio u�sakymo n�ra".
    else do:
            display uzsakymas with 1 col.
            message "Ar tikrai norite i�trinti �� u�sakym�?" view-as alert-box
            question buttons yes-no update
            lOKtoDelete as logical.
            if lOKtoDelete then 
            do:
                delete uzsakymas. 
                message "U�sakymas i�trintas!" view-as alert-box.
            end.
    end.
 
