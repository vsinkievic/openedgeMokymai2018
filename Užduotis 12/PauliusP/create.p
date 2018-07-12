{dataset.i}
define input-output parameter dataset for ds_dataset.
define variable klientoNr as integer no-undo.
define frame remelis_create
    ttclient.CustNum label "Kliento id."
    ttclient.Name label "Vardas" format "x(20)"
    ttclient.country label "Ğalis" format "x(4)"
    with 1 col centered title "Kuriamo kliento duomenys".

temp-table ttClient:tracking-changes = true.

find last ttClient.
klientoNr = ttClient.custNum + 1.

create ttClient.
ttclient.CustNum = klientoNr.
display ttClient.CustNum with frame remelis_create.
update ttclient.Name ttclient.Country with frame remelis_create.

temp-table ttClient:tracking-changes = false.

hide frame remelis_create.
