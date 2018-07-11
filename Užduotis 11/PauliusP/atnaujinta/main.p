using liftas.*.
using keleivis.*.
using pastatas.*.

define variable as_keleivis1 as IKeleivis no-undo.
define variable as_liftas as class liftas no-undo.
define variable as_keleivis as class keleivis no-undo.
define variable as_pastatas as class pastatas no-undo.

define variable svoris as decimal no-undo.
define variable pasirinktas_aukstas as integer no-undo.
define variable esamas_aukstas as integer no-undo.

output to "ataskaita.txt".

//Èia ávedame duomenis pradiniam variantui.
update svoris label "Jûsø svoris" esamas_aukstas label "Ið kur" pasirinktas_aukstas label "Á kur" with 1 col.

as_pastatas = new pastatas().
as_liftas = new liftas(as_pastatas:aukstu_kiekis, as_pastatas:maxKeliamasSvoris).
as_keleivis = new keleivis(esamas_aukstas, pasirinktas_aukstas, svoris).

//Pirmojo keleivio kelionë.
put unformatted "Liftas: " as_liftas:dabartinis_aukstas "aukðte. Keleivis:" as_keleivis:esamas_aukstas "aukðte." skip(1).
as_keleivis:aukstoPakeitimas(as_liftas, as_pastatas).
put unformatted "Liftas: " as_liftas:dabartinis_aukstas "aukðte. Keleivis:" as_keleivis:esamas_aukstas "aukðte." skip(1).

output close.
output to "kita_ataskaita.txt".

//Ðiuo atveju ið anksto priskiriame pradiná aukðtà ir tikslà.
as_keleivis1 = new keleivisTurintisVarda(5, 9, svoris,"Juozapas").

//Antrojo keleivio kelionë.
put unformatted "Liftas: " as_liftas:dabartinis_aukstas "aukðte. Keleivis:" as_keleivis1:esamas_aukstas "aukðte." skip(1).
as_keleivis1:aukstoPakeitimas(as_liftas, as_pastatas).
put unformatted "Liftas: " as_liftas:dabartinis_aukstas "aukðte. Keleivis:" as_keleivis1:esamas_aukstas "aukðte." skip(1).