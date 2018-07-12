{dataset.i}

define input-output parameter dataset for ds_dataset.
define variable klientoNr as integer no-undo.
define frame remelis_delete
    skip
    klientoNr label "Kliento ID"
    with 1 col centered title "Ðalinamo kliento duomenys".

update klientoNr with frame remelis_delete.

temp-table ttClient:tracking-changes = true.

find first ttClient where ttclient.custnum = klientoNr.
delete ttClient.
display "Klientas iðtrintas" with frame remelis_delete.

temp-table ttClient:tracking-changes = false.

hide frame remelis_delete.