define variable eilute as character no-undo format "x(20)".
define variable VyrVard as integer no-undo.
define variable MotVard as integer no-undo.
define variable VyrVardDvi as integer no-undo.
define variable MotVardDvi as integer no-undo.

input from "Vardai.txt".
output to VyriskiVardai.txt.
repeat:
    import unformatted eilute.
    if substring(eilute,length(eilute)) = 's'
        then do:
           
            if index(eilute, ' ') = 0 then do:
             VyrVard = VyrVard + 1.
             export eilute.
             end.
             
         else do:
            VyrVardDvi = VyrVardDvi + 1. 
            export eilute.
            end.
            end.
            
    else do:
        if index(eilute, ' ') = 0 then do:
             MotVard = MotVard + 1.
             end.
             
         else do:
            MotVardDvi = MotVardDvi + 1. 
            end.
    end.
end. 
input close.
output to Ataskaita.txt.
display VyrVard  VyrVardDvi  MotVard  MotVardDvi.
output close.

input from "Vardai.txt".
output to MoteriskiVardai.txt.
repeat:
    import unformatted eilute.
    if substring(eilute,length(eilute)) <> 's'
        then do:
                export eilute.
                end.
            end.
            input close.
            output close.
            
            input from "Vardai.txt".
output to AtnaujintiVardai.txt.
repeat:
    import unformatted eilute.
    if eilute = "Egle" then eilute = "Eglë".
     if eilute = "Urte" then eilute = "Urtë".
     if eilute = "Kestutis" then eilute = "Kæstutis".
   export eilute.                 
  end.               
            input close.
            output close.
            
            


