using determinant.*.

routine-level on error undo, throw.

class kLygtis1:
    define variable a as decimal no-undo.
    define variable b as decimal no-undo.
    define variable c as decimal no-undo.
    define variable d as class determinant no-undo.
    define public property x1 as decimal no-undo get.
    private set.
    define public property x2 as decimal no-undo get.
    private set.
    define public property sprestina as log no-undo get.
    private set.
    
    constructor public kLygtis1 (a as decimal, b as decimal, 
        c as decimal):

        d = new determinant(a, b, c).
    
        if d:val < 0 or a = 0 then do:
            x1 = ?.
            x2 = ?.
            sprestina = false.
        end.
        else if d:val > 0 then do:
            x1 = (- b + sqrt(d:val)) / 2 * a.
            x2 = (- b - sqrt(d:val)) / 2 * a.
            sprestina = true.
        end.
        else if d:val = 0 then do:
            x1 = (- b) / 2 * a.
            x2 = ?.
            sprestina = true.
        end.
    end.
        
end class.    
