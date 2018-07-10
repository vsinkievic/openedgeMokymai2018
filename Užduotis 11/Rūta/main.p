define variable pastatas as Pastatas no-undo.
define variable liftas as Liftas no-undo.
define variable keleivis as Keleivis no-undo.

pastatas = new Pastatas().
liftas = new Liftas(pastatas:aukstuSkaicius).
keleivis = new Keleivis(pastatas:aukstuSkaicius).

/*bandymas*/
keleivis:IskvieskLifta(liftas, 2).
keleivis:IlipkILifta(liftas).