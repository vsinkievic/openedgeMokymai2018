define variable EDITORIUS as character no-undo view-as editor size 40 by 2 max-chars 70 init " ".
define variable IvestasTekstas as character no-undo format "x(70)".
define variable i as integer init 0 no-undo.
define variable AverageIlgis as decimal no-undo.
define variable AverageIlgisBeTarpu as decimal no-undo.

define temp-table Lentele
    field Nr as integer
    field Tekstas as character format "x(70)"
    field Ilgis as integer 
    field IlgisBeTarpu as integer.
    
define frame Edit 
    EDITORIUS skip(1)
    //Taisyti
with centered row 3 title "Iveskite teksta" use-text.

do while length(EDITORIUS) > 0:
    update EDITORIUS with frame Edit.
    
    IvestasTekstas = EDITORIUS.
    create Lentele.
    Lentele.Nr = i.
    Lentele.Tekstas = IvestasTekstas.
    Lentele.ilgis = length (IvestasTekstas).
    do while index(IvestasTekstas,"  ") > 0:
        IvestasTekstas = replace(IvestasTekstas,"  "," ").
    end.
    Lentele.IlgisBeTarpu = length (IvestasTekstas).
    i = i + 1.
    
    if Lentele.IlgisBeTarpu < 20
        then message IvestasTekstas view-as alert-box.
    if Lentele.IlgisBeTarpu > 20 and Lentele.IlgisBeTarpu < 40
        then do:
             message substring(IvestasTekstas,1,20) skip(1)
                    substring(IvestasTekstas,20)
             view-as alert-box.
        end.
    if Lentele.IlgisBeTarpu > 40 
        then do:
             message substring(IvestasTekstas,1,20) skip(1)
                    substring(IvestasTekstas,20,40) skip(1)
                    substring(IvestasTekstas,40) 
             view-as alert-box.
        end.
end.

i = 0.
for each Lentele:
    AverageIlgis = AverageIlgis + Lentele.Ilgis.
    AverageIlgisBeTarpu = AverageIlgisBeTarpu + Lentele.IlgisBeTarpu.
    i = i + 1.
end.

AverageIlgis = AverageIlgis / i.
AverageIlgisBeTarpu = AverageIlgisBeTarpu / i.

display  AverageIlgis label "Vidurikis ilgio (Nemodifikuoto failo)" skip(1)
    AverageIlgisBeTarpu label "Vidurikis ilgio (Modifikuoto failo)".

    
    
