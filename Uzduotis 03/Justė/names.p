define variable i as integer no-undo.
define variable cNameRecord as character no-undo format "x(30)".
define variable iWomenCount as integer init 0.
define variable iMenCount as integer init 0.
define variable iMenNameCount as integer init 0.
define variable iWomenNameCount as integer init 0.

define stream men.
define stream women.
define stream newNames.

output stream men to value ("men.txt").
output stream women to value ("women.txt").
output stream newNames to value ("new_names.txt").

input from names.txt.

repeat:
    import unformatted cNameRecord.
    if (substring(cNameRecord, LENGTH(cNameRecord))="s") then do:
        iMenCount = iMenCount + 1.
        export stream men cNameRecord.
        if index(cNameRecord," ") > 0 then iMenNameCount = iMenNameCount + 1.
    end.
    else do:
        iWomenCount = iWomenCount + 1.
        export stream women cNameRecord.
        if index(cNameRecord, " ") > 0 then iWomenNameCount = iWomenNameCount + 1.
    end.
    
   cNameRecord = replace (cNameRecord, "Zigis", "Zigmantas").
   cNameRecord = replace (cNameRecord, "Ula", "�la").
   cNameRecord = replace (cNameRecord, "Azuolas", "��uolas").
   export stream newNames cNameRecord.
       
end.

input close.
output stream men close.
output stream women close.
output stream newNames close.

output to "ataskaita.txt".
put unformatted substitute ("Moteri�ki vardai: &1 ~nDvigubi moteri�ki vardai: &2 ~nVyri�ki vardai: &3 ~nDvigubi vyri�ki vardai: &4",
                            iWomenCount, iWomenNameCount, iMenCount, iMenNameCount).
output close.
      
    
    
