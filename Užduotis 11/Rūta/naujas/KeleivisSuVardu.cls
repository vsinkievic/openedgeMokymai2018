using Progress.Lang.*.

block-level on error undo, throw.

class KeleivisSuVardu implements IKeleivis: 

    define property vardas as character no-undo 
    get.
    set.
    define variable keleivis as Keleivis no-undo.
    
    constructor KeleivisSuVardu(vardas as character):
        keleivis = new Keleivis().
        this-object:vardas = vardas.
    end constructor.
    
    method public void IskvieskLifta(liftas as Liftas, aukstas as integer):
        message "Keleivio vardas" vardas.
        keleivis:IskvieskLifta(liftas, aukstas).
    end method. 
    
    method public void VaziuokLiftu(aukstas as integer, svoris as integer):
        keleivis:VaziuokLiftu(aukstas, svoris).
    end method. 
    
    method public void IlipkILifta(liftas as Liftas):
        keleivis:IlipkILifta(liftas).
    end method.  
    
    method public void IslipkIsLifto():
        keleivis:IslipkIsLifto().
    end method. 

end class.