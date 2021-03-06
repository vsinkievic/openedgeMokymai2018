class qEquation2: 

     define public property x1 as decimal no-undo
        get.
        private set.
    define public property x2 as decimal no-undo
        get.
        private set.
    define variable d as decimal no-undo.
        
    method public log hasSolution(a as decimal, b as decimal, c as decimal):        
        d = a * b - 4 * a * c.
        if d < 0 then do:
            assign x1 = ? x2 = ?.
            return false.
        end.
        else if d = 0 then do:
            x1 = (- b) / (2 * a).
            x2 = ?.
            return true.
        end. 
        else do:
            x1 = (- b + sqrt(d)) / (2 * a).
            x2 = (- b - sqrt(d)) / (2 * a).
            return true.
        end.                      
    end.
    
end class.