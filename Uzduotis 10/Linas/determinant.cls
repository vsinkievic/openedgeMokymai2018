routine-level on error undo, throw.

class determinant:
    
    define variable a as decimal no-undo.
    define variable b as decimal no-undo.
    define variable c as decimal no-undo.
    define public property val as decimal no-undo get.
    private set.
    
    constructor public determinant (a as decimal, b as decimal, 
        c as decimal):
            val = b * b - 4 * a * c.
    end.
    
end.