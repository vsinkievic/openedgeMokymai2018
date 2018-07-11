define variable namas as Pastatas no-undo.
define variable keleivis1 as IKeleivis no-undo.
define variable keleivis2 as IKeleivis no-undo.
define variable liftas as Liftas no-undo.

define variable svoris as integer no-undo.
define variable aukstas as integer no-undo.
define variable namoAukstis as integer no-undo.

namoAukstis = random(1,20).
liftas = new Liftas(20,300,20).
namas = new Pastatas(namoAukstis, liftas).

output to "lifto_ataskaita.txt".

/*---------------Pabandymai---------------*/
run generuokRandomZmogu.
keleivis1 = new KeleivisSuVardu(svoris, aukstas,"Jonas").
run generuokRandomZmogu.
keleivis2 = new KeleivisSuVardu(svoris, aukstas, "Pranas").

keleivis1:persikelkIKitaAuksta(liftas,50).
/*keleivis1:persikelkIkitaAuksta(liftas,8).*/
keleivis2:iskvieskLifta(liftas).
keleivis1:iskvieskLifta(liftas).
keleivis2:persikelkIKitaAuksta(liftas,10).
keleivis1:persikelkIKitaAuksta(liftas,6).

    
procedure generuokRandomZmogu:
    assign
        svoris = random(10,200)
        aukstas = random(1,namoAukstis).
end procedure.
