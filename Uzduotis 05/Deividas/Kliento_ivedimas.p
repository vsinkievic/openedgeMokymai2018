define variable kodas as integer no-undo.
define variable pavadinimas as character format "x(30)" no-undo.

define frame ivedimas
kodas label "Iveskite kliento kod�"
pavadinimas label "Iveskite Kliento pavadinim�".

display "Naujo kliento suk�rimas" with centered 1 col.

update kodas pavadinimas
with frame ivedimas.

find klientas where klientas.kodas = kodas or klientas.pavadinimas = pavadinimas no-error.
if available klientas then message "Toks klientas jau yra!" view-as alert-box.
else do:
    create klientas.
    klientas.kodas = kodas.
    klientas.pavadinimas = pavadinimas.
    message "Naujas klientas �ra�ytas!" view-as alert-box.
end.


