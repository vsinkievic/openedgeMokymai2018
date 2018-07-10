using Progress.Lang.*.

block-level on error undo, throw.

class Pastatas: 

    define public property aukstis as integer no-undo get. private set.
    define variable liftas as Liftas no-undo.
    
    constructor Pastatas(aukstis as integer, liftas as Liftas):
        this-object:aukstis = aukstis.
        this-object:liftas = liftas.
        sureguliuokLifta(aukstis).
    end constructor.
    
    /*Galima sureguliuoti maksimalø lifto pakilimo aukðtá*/
    method public void sureguliuokLifta(aukstis as integer):
        liftas:maxAukstis = aukstis.
        liftas:esamasAukstas = random(1,aukstis).
    end method.
    
end class.