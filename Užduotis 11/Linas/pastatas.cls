routine-level on error undo, throw.

class pastatas:
    
    define public property aukstuSk as integer no-undo get.
    private set.
    
    constructor pastatas():
        aukstuSk = random(3, 16).
    end.
    
end.
