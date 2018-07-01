define variable numeris as integer no-undo.

define frame ivedimas
numeris label "Ávesktie uþsakymo numeri kurá norite trinti".

update numeris
with frame ivedimas.

find uzsakymas where uzsakymas.numeris = numeris.
if not available uzsakymas then message "Tokio uþsakymo nëra".
else do:
        display uzsakymas with 1 col.
        message "Ar tikrai norite iðtrinti ðá uþsakymà?" view-as alert-box
        question buttons yes-no update
        lOKtoDelete as logical.
        if lOKtoDelete then 
        do:
            delete uzsakymas. 
            message "Uþsakymas iðtrintas!" view-as alert-box.
        end.
    end.
 
