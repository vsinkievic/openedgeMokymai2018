define variable editorius as character no-undo view-as editor size 40 by 2 
               scrollbar-vertical max-chars 70 label "Teksto editorius".

define temp-table tt_antraUzd no-undo
    field Nr as integer
    field Tekstas as character format "x(70)"
    field ilgis as integer
    field ilgisBeTarpu as integer.

update editorius.

