using Progress.Lang.*.

block-level on error undo, throw.

class Liftas: 
    
    define property laisvasLiftas as logical no-undo 
    get.
    public set.
    define property atidarytosDurys as logical no-undo 
    get.
    public set.
    define property paskirtiesAukstas as integer no-undo 
    get.
    public set.
    define property esamasAukstas as integer no-undo 
    get.
    public set.
        
    constructor Liftas(aukstuSkaicius as integer):
        laisvasLiftas = true.
        atidarytosDurys = false.
        esamasAukstas = random(1, aukstuSkaicius).
    end constructor.
    
    method public void AtidarykDuris():
        if atidarytosDurys = false 
        then do:
           atidarytosDurys = true.
           message "Durys atsidare".
        end.
    end method.
    
    method public void UzdarykDuris():
        if atidarytosDurys = true 
        then do:
           atidarytosDurys = false.
           message "Durys uzsidare".
        end.
    end method.
    
    method public void Atvaziuok(aukstas as integer):
        paskirtiesAukstas = aukstas.
        
        if paskirtiesAukstas < esamasAukstas
        then do:
            repeat while paskirtiesAukstas <= esamasAukstas:
                message "Liftas" esamasAukstas "aukste".
                esamasAukstas = esamasAukstas - 1.
            end.
        end.
        
        else if paskirtiesAukstas > esamasAukstas
        then do:
            repeat while paskirtiesAukstas >= esamasAukstas:
                message "Liftas" esamasAukstas "aukste".
                esamasAukstas = esamasAukstas + 1.
            end.
        end.
        
        else do:
            message "Liftas" esamasAukstas "aukste".
        end.
        
        message "Liftas atvaziavo".
        atidarykDuris().
    end method.

end class.