define variable id as integer no-undo.
define variable cName as character no-undo.

define frame kl-ivedimas
    id label "Kodas" skip 
    cName label "Pavadinimas" format "x(64)"
    with side-labels 1 col width 100.

update id cName 
    with frame kl-ivedimas.  

find Customer where Customer.id = id no-error.
if available Customer then 
    message "Klientas su tokiu kodu jau yra, áveskite ið naujo." view-as alert-box.
else do:
    create Customer.
    Customer.Id = id.
    Customer.Name = cName.
end.
