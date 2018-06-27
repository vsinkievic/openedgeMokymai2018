define variable nameOne as character no-undo format "x(30)".
define variable nameTwo as character no-undo format "x(30)".
define variable femaleNames as integer no-undo.
define variable maleNames as integer no-undo.
define variable doubleFemaleNames as integer no-undo.
define variable doubleMaleNames as integer no-undo.
define variable incorrectFemaleNames as character no-undo extent 3 init ["Onute", "Migle", "Agne"].
define variable incorrectMaleNames as character no-undo extent 3 init ["Kestutis", "Sarunas", "Dziugas"].
define variable correctFemaleNames as character no-undo extent 3 init ["Onutë", "Miglë", "Agnë"].
define variable correctMaleNames as character no-undo extent 3 init ["Kæstutis", "Ðarûnas", "Dþiugas"].
define variable i as integer no-undo.

input from "names.txt".

define stream male.
define stream female.
define stream corrected.

output stream male to "malenames.txt".
output stream female to "femalenames.txt".
output stream corrected to "correctedNames.txt".

repeat:
    nameTwo = ?.
    import delimiter " " nameOne nameTwo.
    
    if substr(nameOne, length(nameOne)) = "s" then do:
        maleNames = maleNames + 1.
        if nameTwo <> ? then do: 
            doubleMaleNames = doubleMaleNames + 1. 
            export stream male nameOne nameTwo.
        end.
        else do:
            export stream male nameOne.
        end.
        
        i = 1.
        repeat while i <= extent(incorrectMaleNames):
            if nameOne = incorrectMaleNames[i] then nameOne = correctMaleNames[i].
            if nameTwo = incorrectMaleNames[i] then nameTwo = correctMaleNames[i].
            i = i + 1.
        end.

        if nameTwo <> ? then do: 
            export stream corrected nameOne nameTwo. 
        end.
        else do: 
            export stream corrected nameOne.
        end.
        
    end.
    else do:
        femaleNames = femaleNames + 1.
        if nameTwo <> ? then do: 
            doubleFemaleNames = doubleFemaleNames + 1.
            export stream female nameOne nameTwo.
        end.
        else do:
            export stream female nameOne.
        end.
        
        i = 1.
        repeat while i <= extent(incorrectFemaleNames):
            if nameOne = incorrectFemaleNames[i] then nameOne = correctFemaleNames[i].
            if nameTwo = incorrectFemaleNames[i] then nameTwo = correctFemaleNames[i].
            i = i + 1.
        end.
        
        if nameTwo <> ? then do: 
            export stream corrected nameOne nameTwo. 
        end.
        else do: 
            export stream corrected nameOne.
        end.
        
    end.
       
end.

display maleNames label "Male name count" 
    doubleMaleNames label "Double male names"
    femaleNames label "Female name count" 
    doubleFemaleNames label "Double female names".

input close.
output stream male close.
output stream female close.
output stream corrected close.