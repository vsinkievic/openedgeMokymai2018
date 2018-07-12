{dataset.i}

define input-output parameter dataset for dsCust.
define variable newId as integer no-undo.
define variable newName as character no-undo format "x(20)".
define variable newCity as character no-undo format "x(20)".
define variable newCountry as character no-undo format "x(20)".

define frame fr ttCust.Cust-Num ttCust.Name ttCust.City with width 100 1 col.

find last ttCust.
newId = ttcust.Cust-Num + 1.

update newName label "�veskite naujo kliento pavadinim�".
update newCity label "�veskite naujo kliento miest�".
update newCountry label "�veskite naujo kliento valstyb�".

temp-table ttCust:tracking-changes = true.

create ttCust.
ttCust.Cust-Num = newId.
ttCust.Name = newName.
ttCust.City = newCity.
ttCust.Country = newCountry.

display ttCust with frame fr title "Sukurtas klientas".

temp-table ttCust:tracking-changes = false.