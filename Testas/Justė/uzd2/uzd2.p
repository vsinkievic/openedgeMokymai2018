define variable userInput as character
    view-as editor size 40 by 2 max-chars 70.
define variable formattedInput as character.
define temp-table ttEditedInput 
    field Nr as integer
    field Tekstas as character format "x(70)"
    field Ilgis as integer
    field IlgisBeTarpu as integer.
define variable inputLength as integer no-undo.
define variable formattedLength as integer no-undo.
define variable i as integer init 0.
define variable inputCount as integer init 0.
define variable avgInput as decimal init 0 format ">9".
define variable avgFormatted as decimal init 0 format ">9".
define frame fInput userInput.

loop:
repeat:
    userInput = "".
    update userInput label "Vartotojo ávestis" help "Áveskite laisvà tekstà." with frame fInput.
    inputLength = length(userInput).
    inputCount = inputCount + 1.
    avgInput = avgInput + inputLength.
    formattedInput = userInput.
    do while index(formattedInput,"  ") <> 0 or index(formattedInput,"~t~t") <> 0:
        formattedInput = replace(formattedInput,"  "," ").
        formattedInput = replace(formattedInput,"~t~t","~t").
    end.
    formattedLength = length(formattedInput).
    avgFormatted = avgFormatted + formattedLength.
    
    if formattedInput = " " or formattedInput = "~t" or formattedInput = ""
    then leave loop.
    
    do transaction:
        create ttEditedInput.
        i = i + 1.
        assign
            ttEditedInput.Nr = i
            ttEditedInput.Tekstas = userInput
            ttEditedInput.Ilgis = inputLength
            ttEditedInput.IlgisBeTarpu = formattedLength. 
    end.
    
    if formattedLength <= 20
    then message formattedInput view-as alert-box.
    else if formattedLength > 20 and formattedLength <= 40
    then message substring(formattedInput,1,20) skip 
                 substring(formattedInput,20) view-as alert-box.
    else message substring(formattedInput,1,20) skip 
                 substring(formattedInput,20,20) skip
                 substring(formattedInput,40) view-as alert-box.  
end.

avgInput = avgInput / inputCount.
avgFormatted = avgFormatted / inputCount.

display "Vidutinis ávesto teksto ilgis: " avgInput no-label skip
        "Vidutinis suformatuoto teksto ilgis: " avgFormatted no-label with width 50.