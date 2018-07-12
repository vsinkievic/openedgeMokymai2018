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

update id label "�veskite nr. kliento, kurio informacij� norite modifikuoti".
find ttCust where ttCust.Cust-Num = id no-error.
if available ttCust then do:
    display ttCust.Name
            ttCust.City
            ttCust.Country
            with 1 col.
    
    update newName label "�veskite nauj� kliento pavadinim�" /*kaip po velni� padaryti, kad tilpt�??*/
           newCity label "�veskite nauj� kliento miest�" //format "x(50)"
           newCountry label "�veskite nauj� kliento valstyb�" //format "x(50)"
           with 1 col.
    
    temp-table ttCust:tracking-changes = true.
    
    ttCust.Name = newName.
    ttCust.City = newCity.
    ttCust.Country = newCountry.
    
    display ttCust with frame fr title "Kliento informacija modifikuota".
    
    temp-table ttCust:tracking-changes = false.
end.
else do:
    message "N�ra tokio kliento" view-as alert-box.   
end.