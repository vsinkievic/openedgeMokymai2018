{dataset.i}

define input-output parameter dataset for dsCust.
define variable id as integer no-undo.
define variable newName as character no-undo format "x(20)".
define variable newCity as character no-undo format "x(20)".
define variable newCountry as character no-undo format "x(20)".

define frame fr ttCust.Cust-Num skip 
                ttCust.Cust-Num skip 
                ttCust.Name skip 
                ttCust.City skip with 1 col width 100.

update id label "Áveskite nr. kliento, kurio informacijà norite modifikuoti".
find ttCust where ttCust.Cust-Num = id no-error.
if available ttCust then do:
    display ttCust.Name
            ttCust.City
            ttCust.Country
            with 1 col.
    
    update newName label "Áveskite naujà kliento pavadinimà" /*kaip po velniø padaryti, kad tilptø??*/
           newCity label "Áveskite naujà kliento miestà" //format "x(50)"
           newCountry label "Áveskite naujà kliento valstybæ" //format "x(50)"
           with 1 col.
    
    temp-table ttCust:tracking-changes = true.
    
    ttCust.Name = newName.
    ttCust.City = newCity.
    ttCust.Country = newCountry.
    
    display ttCust with frame fr title "Kliento informacija modifikuota".
    
    temp-table ttCust:tracking-changes = false.
end.
else do:
    message "Nëra tokio kliento" view-as alert-box.   
end.