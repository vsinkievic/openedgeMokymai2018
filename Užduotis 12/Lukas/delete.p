{dataset.i}

define input-output parameter dataset for dsCust.
define variable id as integer no-undo.
define variable confirmDelete as logical no-undo.

define frame fr ttCust.Cust-Num skip 
                ttCust.Cust-Num skip 
                ttCust.Name skip 
                ttCust.City skip with 1 col width 100.

update id label "�veskite nr. kliento, kur� norite i�trinti".
find ttCust where ttCust.Cust-Num = id no-error.
if available ttCust then do:
    display ttCust with frame fr.
    temp-table ttCust:tracking-changes = true.
    message "Ar norite i�trinti �� klient�?" view-as alert-box 
    question buttons yes-no update confirmDelete.                                   
    if confirmDelete then delete ttCust.                                     
    temp-table ttCust:tracking-changes = false.
end.
else do:
    message "N�ra tokio kliento" view-as alert-box.
end.