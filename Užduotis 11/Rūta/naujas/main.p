define variable pastatas as Pastatas no-undo.
define variable liftas as Liftas no-undo.
define variable keleivis as KeleivisSuVardu no-undo.

pastatas = new Pastatas().
liftas = new Liftas(pastatas:aukstuSkaicius).
keleivis = new KeleivisSuVardu("Jonas").

/*------------------------------------------*/
keleivis:IskvieskLifta(liftas, 2).
keleivis:IlipkILifta(liftas).
keleivis:VaziuokLiftu(4, 70).
keleivis:IslipkIsLifto().