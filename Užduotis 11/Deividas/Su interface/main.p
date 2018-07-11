



define variable liftas as class Liftas no-undo.
define variable pastatas as class Pastatas no-undo.
define variable keleivis as class IKeleivis no-undo.

output to "lifto_ataskaita.txt".

pastatas = new Pastatas().
liftas = new Liftas(pastatas:aukstuSkaicius, 150).
keleivis = new keleivisSuVardu("Petras").

keleivis:persikelkIKitaAuksta(liftas).
//keleivis:persikelkIKitaAuksta(liftas).