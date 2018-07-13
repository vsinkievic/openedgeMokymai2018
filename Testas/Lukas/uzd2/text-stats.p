define variable textInput as character no-undo view-as editor size 40 by 2 max-chars 70.
define variable formText as character no-undo view-as editor size 20 by 4 max-chars 70.
define variable entryNr as integer no-undo init 0.
/*define variable totUnfLength as integer no-undo init 0. */
/*define variable totFormLength as integer no-undo init 0.*/
define variable avgUnf as decimal no-undo.
define variable avgForm as decimal no-undo.


define temp-table ttTextStats no-undo
    field Nr as integer 
    field Tekstas as character format "x(70)"
    field Ilgis as integer 
    field IlgisBeTarpu as integer. 
    

ivedimas:    
do transaction:
    repeat:
        update textInput.
        if length (textInput) > 0 then do:
/*            totUnfLength = totUnfLength + length (textInput).*/
            formText = TRIM (textInput).
            do while formText matches "*  *":
               formText = replace (formText, "  ", " ").
            END.
/*            totFormLength = totFormLength + length (formText).*/
            
            create ttTextStats.
            entryNr = entryNr + 1.
                ttTextStats.Nr = entryNr.
                ttTextStats.Tekstas = textInput.
                ttTextStats.Ilgis = length (textInput).
                ttTextStats.IlgisBeTarpu = length (formText).
            
            if (LENGTH (formText) > 20 and LENGTH (formText) <= 40) then do:
                message substring(formText, 1, 20) skip
                        substring(formText, 21, 20) skip
                        view-as alert-box.
            end.
            else if (LENGTH (formText) > 40) then do:
                message substring(formText, 1, 20) skip
                        substring(formText, 21, 20) skip
                        substring(formText, 41) skip
                        view-as alert-box.
            end.
            else do:
                message formText view-as alert-box.
            end.
            textInput = "".
        end.
        else do:
            undo, leave ivedimas.
        end.
    end.
end.

//Kitas bûdas vidurkiams rasti.
/*avgUnf = totUnfLength / entryNr.  */
/*avgForm = totFormLength / entryNr.*/

message "Baigtas ávedimas" view-as alert-box.

for each ttTextStats:
    avgUnf = ttTextStats.Ilgis.
    avgForm = ttTextStats.IlgisBeTarpu.                                              
    display
        ttTextStats.Tekstas label "Neformatuotas tekstas"
        avgUnf (average) label "Ilgis"
        avgForm (average label "Vidutiniai ilgiai") label "Formatuotas ilgis"
        with width 150.
end.

/*display avgUnf label "Vid. teksto ilgis" avgForm label "Vid. form. teksto ilgis".*/