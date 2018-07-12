{dataset.i}

define input-output parameter dataset for ds_dataset.
define variable klientoNr as integer no-undo.
define frame remelis_update
    klientoNr label "Kliento ID" skip(1)
    ttclient.Name label "Vardas" format "x(20)"
    ttclient.country label "Ðalis" format "x(15)"
    with 1 col centered title "Keièiamo kliento duomenys".

update klientoNr with frame remelis_update.

temp-table ttClient:tracking-changes = true.

find first ttClient where ttclient.custnum = klientoNr.
update ttclient.Name ttclient.Country with frame remelis_update.

temp-table ttClient:tracking-changes = false.

hide frame remelis_update.
