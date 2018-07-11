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

//�ia �vedame duomenis pradiniam variantui.
update svoris label "J�s� svoris" esamas_aukstas label "I� kur" pasirinktas_aukstas label "� kur" with 1 col.

as_pastatas = new pastatas().
as_liftas = new liftas(as_pastatas:aukstu_kiekis, as_pastatas:maxKeliamasSvoris).
as_keleivis = new keleivis(esamas_aukstas, pasirinktas_aukstas, svoris).

//Pirmojo keleivio kelion�.
put unformatted "Liftas: " as_liftas:dabartinis_aukstas "auk�te. Keleivis:" as_keleivis:esamas_aukstas "auk�te." skip(1).
as_keleivis:aukstoPakeitimas(as_liftas, as_pastatas).
put unformatted "Liftas: " as_liftas:dabartinis_aukstas "auk�te. Keleivis:" as_keleivis:esamas_aukstas "auk�te." skip(1).

output close.
output to "kita_ataskaita.txt".

//�iuo atveju i� anksto priskiriame pradin� auk�t� ir tiksl�.
as_keleivis1 = new keleivisTurintisVarda(5, 9, svoris,"Juozapas").

//Antrojo keleivio kelion�.
put unformatted "Liftas: " as_liftas:dabartinis_aukstas "auk�te. Keleivis:" as_keleivis1:esamas_aukstas "auk�te." skip(1).
as_keleivis1:aukstoPakeitimas(as_liftas, as_pastatas).
put unformatted "Liftas: " as_liftas:dabartinis_aukstas "auk�te. Keleivis:" as_keleivis1:esamas_aukstas "auk�te." skip(1).