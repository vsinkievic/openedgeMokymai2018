
class Pastatas:
    define property aukstuSkaicius as integer no-undo get.
    private set.
    define variable liftas as Liftas no-undo.
    
    constructor pastatas():
    aukstuSkaicius = 20.
    message "Pastate yra " aukstuSkaicius "auk�t�.".
    end constructor.
    
    
end class.