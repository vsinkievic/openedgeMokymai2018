
define variable cEditor as character no-undo 
    view-as editor size 40 by 2 format "x(70)" init " ".

define variable cSuformatuotas as character no-undo format "x(70)".
    
define temp-table ttTable 
    field Nr as integer
    field Tekstas as character format "x(70)"
    field Ilgis as integer 
    field IlgisBeTarpo as integer.

define frame fEditor with centered row 2.
enable all with frame fEditor.
/*wait-for window-close of current-window.*/

do while length(cEditor) > 0:

    update cEditor help "Áveskite koká nors tekstà" with frame fEditor.
    cSuformatuotas = cEditor.
    
    create ttTable.
    ttTable.Tekstas = cEditor.
    ttTable.Ilgis = length(cEditor).
    
    tarpoSumazinimas:    // tarpø sumaþinimas:
    repeat:
        if index(cSuformatuotas, "  ") > 0 then do:
            cSuformatuotas = replace(cSuformatuotas, "  ", " ").
        end.
        else leave tarpoSumazinimas.
    end.
    
    ttTable.IlgisBeTarpo = length(cSuformatuotas).
    
    if ttTable.IlgisBeTarpo <= 20 
        then message cEditor view-as alert-box.
    if ttTable.IlgisBeTarpo > 20 and ttTable.IlgisBeTarpo <= 40
        then message substring(cEditor, 1, 20) skip substring(cEditor, 21, length(cEditor) - 20) 
        view-as alert-box.
    if ttTable.IlgisBeTarpo > 40 
        then message substring(cEditor, 1, 20) skip substring(cEditor, 21, 20)
        skip substring(cEditor, 41, length(cEditor) - 40) 
        view-as alert-box.

end.

for each ttTable:
    accumulate ttTable.Ilgis (average).
    accumulate ttTable.IlgisBeTarpo (average).
end.

display (accum average ttTable.Ilgis) label "Vidutinis ávesto teksto ilgis".
display (accum average ttTable.IlgisBeTarpo) label "Vidutinis suformatuoto teksto ilgis".


