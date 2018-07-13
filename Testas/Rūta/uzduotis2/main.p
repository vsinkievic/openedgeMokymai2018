define variable textEditor as character no-undo view-as editor size 40 by 2 max-chars 70 scrollbar-vertical label "Editor".
define temp-table ttText no-undo field Nr as integer field Tekstas as character format "x(70)" field Ilgis as integer field IlgisBeTarpu as integer.
define variable formattedText as character no-undo format "x(70)".
define variable textLength as integer no-undo.
define variable averageTextLength as decimal no-undo.
define variable averageFormattedTextLength as decimal no-undo.
define variable i as integer no-undo.
define variable allText as character no-undo.
define variable allFormattedText as character no-undo.

form textEditor with frame clip.
enable textEditor.
update textEditor.

do while (length(textEditor) <> 0):
    formattedText = trim(textEditor, "  ").
    allText = allText + textEditor.
    allFormattedText = allFormattedText + formattedText.
    create ttText.
    ttText.Tekstas = formattedText.
    ttText.Ilgis = length(textEditor).
    ttText.IlgisBeTarpu = length(formattedText).
    
    if length(formattedText) <= 20 then message formattedText view-as alert-box.
    else if length(formattedText) > 20 and length(formattedText) <= 40 then do:
        formattedText = substring(formattedText, 1 , 20, "character") + "~n" + substring(formattedText, 21, ttText.IlgisBeTarpu, "character").
        message formattedtext view-as alert-box.
    end.
    else do:
        formattedText = substring(formattedText, 1 , 20, "character") + "~n" + substring(formattedText, 21, 20, "character") + "~n" + substring(formattedText, 41, ttText.IlgisBeTarpu, "character").
        message formattedtext view-as alert-box.
    end.
    enable textEditor.
    update textEditor.
    i = i + 1.
end.

averageTextLength = length(allText) / i.
averageFormattedTextLength = length(allFormattedText) / i.
message "Vidutinis ivesto teksto ilgis:" averageTextLength "Vidutinis suformatuoto teksto ilgis:" averageFormattedTextLength view-as alert-box.
