define variable iOrdNum as integer no-undo.

update iOrdNum 
   label "U�sakymo numeris" 
   help "�veskite u�sakymo numer�"
   with side-labels. 

find Order exclusive-lock where Order.id = iOrdNum no-error. 
if not available Order then 
    message "Tokio u�sakymo n�ra".
else do:
    delete Order.
    message "U�sakymas" iOrdNum "i�trintas".
end.