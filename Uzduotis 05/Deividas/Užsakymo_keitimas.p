
define variable suma as decimal  no-undo.
define variable data as date no-undo.
define variable oldnumeris as integer no-undo.

define frame keitimas 
     data label "Data" format "9999-99-99" skip
     suma label "Suma"
     with side-labels 1 col width 200.

define frame apzvalga
    uzsakymas.data skip
    uzsakymas.pavadinimas  skip
    uzsakymas.suma
    with side-labels 1 col width 100.
    
    update oldnumeris
    label "Uþsakymo numeris" 
    help "Áveskite uþsakymo numerá"
    with side-labels.
    
    find uzsakymas where uzsakymas.numeris = oldnumeris exclusive-lock no-error.
        if not available uzsakymas 
        then message "Tokio uþsakymo nëra" view-as alert-box.
            else do:
    
                update data suma
                with frame keitimas.
                
                uzsakymas.data = data.
                uzsakymas.suma = suma.
                
               display uzsakymas
               with frame apzvalga.
    
            end.
    
    