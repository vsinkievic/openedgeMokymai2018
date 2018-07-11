using Progress.Lang.*.

block-level on error undo, throw.

class Keleivis implements IKeleivis: 
    
    define property keleivisLifte as logical no-undo 
    get.
    set.
    define variable liftas as Liftas no-undo.
        
    constructor Keleivis():
        keleivisLifte = false.
    end constructor.
    
    method public void IskvieskLifta(liftas as Liftas, aukstas as integer):
        liftas:Atvaziuok(aukstas).
    end method.  
    
    method public void VaziuokLiftu(aukstas as integer, svoris as integer):
        if keleivisLifte = false then message "Keleivio nera lifte".
        else do:
            liftas:Vaziuok(aukstas, svoris).
        end.
    end method. 
    
    method public void IlipkILifta(liftas as Liftas):
        message "Keleivis ilipo i lifta".
        keleivisLifte = true.
        this-object:liftas = liftas.
        liftas:uzdarykDuris().
    end method.  
    
    method public void IslipkIsLifto():
        if keleivisLifte = false then message "Keleivio nera lifte".
        else do:
            message "Keleivis islipo is lifto".
            keleivisLifte = false.
            liftas:uzdarykDuris().
        end.
    end method. 

end class.