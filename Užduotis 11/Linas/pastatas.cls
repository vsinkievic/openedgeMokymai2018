routine-level on error undo, throw.

class pastatas:
    
    define public property aukstuSk as integer no-undo get.
    private set.
    
    constructor pastatas():
        aukstuSk = 9.
        put unformatted substitute ("Pastate yra &1 aukðtai(-ø).", aukstuSk) skip.
    end.
    
end.
