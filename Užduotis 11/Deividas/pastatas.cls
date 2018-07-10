
class pastatas:
    define property aukstuSkaicius as integer no-undo get.
    private set.
        define property keliamojiJega as decimal no-undo get.
    private set.
    
    constructor pastatas():
    aukstuSkaicius = random(3,5).
    keliamojiJega = 100.
    end constructor.
    
    
end class.