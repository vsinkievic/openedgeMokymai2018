using Progress.Lang.*.

block-level on error undo, throw.

class Liftas: 
    
    define property laisvasLiftas as logical no-undo 
    get.
    set.
    define property atidarytosDurys as logical no-undo 
    get.
    set.
    define property esamasAukstas as integer no-undo 
    get.
    set.
    define property aukstuSkaicius as integer no-undo 
    get.
    set.
    define property maxSvoris as integer no-undo 
    get.
    private set.
        
    constructor Liftas(aukstuSkaicius as integer):
        laisvasLiftas = true.
        atidarytosDurys = false.
        this-object:aukstuSkaicius = aukstuSkaicius.
        esamasAukstas = random(1, aukstuSkaicius).
        maxSvoris = 100.
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
        message "Keleivis iskviete lifta i" aukstas "auksta".
        if aukstas > aukstuSkaicius then message "Tokio auksto siame pastate nera".
        else do:
            if aukstas < esamasAukstas
            then do:
                repeat while aukstas <= esamasAukstas:
                    message "Liftas" esamasAukstas "aukste".
                    esamasAukstas = esamasAukstas - 1.
                end.
            end.
            
            else if aukstas > esamasAukstas
            then do:
                repeat while aukstas >= esamasAukstas:
                    message "Liftas" esamasAukstas "aukste".
                    esamasAukstas = esamasAukstas + 1.
                end.
            end.
            
            else do:
                message "Liftas" esamasAukstas "aukste".
            end.
            
            message "Liftas atvaziavo".
            atidarykDuris().
            
            esamasAukstas = aukstas.
        end.
    end method.
    
    method public void Vaziuok(aukstas as integer, svoris as integer):
        if svoris > maxSvoris then message "Keleivio svoris per didelis".
        else do:
            message "Keleivis pasirinko vaziuoti i" aukstas "auksta".
            if aukstas > aukstuSkaicius then message "Tokio auksto siame pastate nera".
            else do:
                aukstas = aukstas.
                
                if aukstas < esamasAukstas
                then do:
                    repeat while aukstas <= esamasAukstas:
                        message "Liftas" esamasAukstas "aukste".
                        esamasAukstas = esamasAukstas - 1.
                    end.
                end.
                
                else if aukstas > esamasAukstas
                then do:
                    repeat while aukstas >= esamasAukstas:
                        message "Liftas" esamasAukstas "aukste".
                        esamasAukstas = esamasAukstas + 1.
                    end.
                end.
                
                else do:
                    message "Liftas" esamasAukstas "aukste".
                end.
                
                message "Liftas atvaziavo".
                atidarykDuris().
                
                esamasAukstas = aukstas.
            end.
        end.
    end method.

end class.