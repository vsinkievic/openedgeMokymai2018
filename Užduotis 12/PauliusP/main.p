{dataset.i}

define button btn-create.
define button btn-update.
define button btn-delete.
define button btn-showcust.

define variable number as integer no-undo.

define frame my_frame skip(1)
    btn-create label "Sukurti naujà klientà" 
    btn-update label "Atnaujinti klientà"
    btn-delete label "Paðalinti klientà" 
    btn-showcust label "Rodyti klientus"
    with 1 col centered title "Klientø duomenø valdymo sistema".
    
on choose of btn-create do:
    run create.p (input-output dataset ds_dataset).
end.

on choose of btn-update do:
    run update.p (input-output dataset ds_dataset).
end.

on choose of btn-delete do:
    run delete.p (input-output dataset ds_dataset).
end.

on choose of btn-showcust do:
    for each ttClient:
        display ttClient.Name label "Vardas" ttClient.CustNum label "Kliento ID." ttClient.country label "Ðalis".
    end.
end.

define data-source srccustomer for Customer .
buffer ttclient:attach-data-source(data-source srccustomer:handle).

data-source srccustomer:fill-where-string = "where Customer.Name begins 'Pa'".

dataset ds_dataset:fill().
buffer ttclient:detach-data-source ().

enable all with frame my_frame.  
wait-for window-close of current-window.

dataset ds_dataset:write-xml ("file", "pirmas.xml", true).