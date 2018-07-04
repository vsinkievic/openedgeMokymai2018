function quadEqSolution returns log (a as decimal, b as decimal, c as decimal, output x1 as decimal, output x2 as decimal):
    
    define variable discr as decimal no-undo.
    define variable solved as log no-undo.
    
    if a <> 0 then do:    
        
        discr = (b * b) - (4 * a * c).
        
        if discr > 0 then do:
            
            x1 = (- b + sqrt(discr)) / (2 * a).
            x2 = (- b - sqrt(discr)) / (2 * a).
            solved =  yes.
            
        end.
        else if discr = 0 then do:
            
            x1 = (- b) / (2 * a).
            x2 = ?.
            solved = yes.
            
        end.
        else do:
            
            x1 = ?.
            x2 = ?.
            solved = no.
            
        end.
    
    end.
    else do:
        x1 = ?.
        x2 = ?.
        solved = no.
    end.
    
    return solved.
    
end function.