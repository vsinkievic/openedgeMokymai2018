using Progress.Lang.*.

block-level on error undo, throw.

class Pastatas: 
    
    define property aukstuSkaicius as integer no-undo 
    get.
    private set.
        
    constructor Pastatas():
        aukstuSkaicius = 5.
    end constructor.
    
end class.