define variable kodas as integer no-undo.
define variable pavadinimas as character format "x(30)" no-undo.

define frame ivedimas
kodas label "Iveskite kliento kodà"
pavadinimas label "Iveskite Kliento pavadinimà".

display "Naujo kliento sukûrimas" with centered 1 col.

update kodas pavadinimas
with frame ivedimas.

find klientas where klientas.kodas = kodas or klientas.pavadinimas = pavadinimas no-error.
if available klientas then message "Toks klientas jau yra!" view-as alert-box.
else do:
    create klientas.
    klientas.kodas = kodas.
    klientas.pavadinimas = pavadinimas.
    message "Naujas klientas árağytas!" view-as alert-box.
    end.


