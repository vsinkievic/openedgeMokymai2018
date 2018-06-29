define variable iOrdNum as integer no-undo.

update iOrdNum 
   label "Uþsakymo numeris" 
   help "Áveskite uþsakymo numerá"
   with side-labels. 

find Order exclusive-lock where Order.id = iOrdNum no-error. 
if not available Order then 
    message "Tokio uþsakymo nëra".
else do:
    delete Order.
    message "Uþsakymas" iOrdNum "iðtrintas".
end.