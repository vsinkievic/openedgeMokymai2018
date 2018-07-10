using Progress.Lang.*.

block-level on error undo, throw.

class Keleivis: 
    
    define property keleivisLifte as logical no-undo 
    get.
    public set.
    define property paskirtiesAukstas as integer no-undo 
    get.
    public set.
        
    constructor Keleivis(paskirtiesAukstas as integer):
        keleivisLifte = false.
        this-object:paskirtiesAukstas = paskirtiesAukstas.
    end constructor.
    
    method public void IskvieskLifta(liftas as Liftas, aukstas as integer):
        message "Keleivis iskviete lifta i" aukstas "auksta".
        liftas:Atvaziuok(aukstas).
    end method.  
    
    method public void IlipkILifta(liftas as Liftas):
        message "Keleivis ilipo i lifta".
        keleivisLifte = true.
        liftas:uzdarykDuris().
    end method.  
    
    method public void IslipkIsLifto(liftas as Liftas):
        message "Keleivis islipo is lifto".
        keleivisLifte = false.
        liftas:uzdarykDuris().
    end method. 

end class.