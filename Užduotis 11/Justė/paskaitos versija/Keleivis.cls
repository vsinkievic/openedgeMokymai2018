using Progress.Lang.*.

block-level on error undo, throw.

class Keleivis implements IKeleivis: 
    
    define protected variable busena as KeleivioBusena no-undo.
    define public property svoris as integer no-undo get. set.
    define protected variable tikslas as integer no-undo.
    define protected variable esamasAukstas as integer no-undo.
    define protected variable laukimoLaikas as integer no-undo.
    
    constructor keleivis(svoris as integer, esamasAukstas as integer):
        this-object:svoris = svoris.
        this-object:esamasAukstas = esamasAukstas.
        busena = KeleivioBusena:pastate.
        laukimoLaikas = 0.
    end constructor.
    
    method public integer getEsamasAukstas():
        return esamasAukstas.
    end method.
    
    method public integer getSvoris():
        return svoris.
    end method.
    
    method public void iskvieskLifta(liftas as Liftas):
        laukimoLaikas = liftas:atvaziuok(esamasAukstas).
        if laukimoLaikas >= 0 
        then busena = KeleivioBusena:laukia.
        liftas:atidarykDuris().
    end method.
    
    method public void persikelkIKitaAuksta(liftas as Liftas, tikslas as integer):
        this-object:tikslas = tikslas.
        iskvieskLifta(liftas).
        busena = KeleivioBusena:lifte.
        liftas:uzdarykDuris().
        if liftas:patikrinkSvori(svoris)
        then do:
            if liftas:vezkKeleivi(tikslas)
            then esamasAukstas = tikslas.
        end.
        
        liftas:atidarykDuris().
            islipkIsLifto().
            liftas:atsilaisvink().
            liftas:uzdarykDuris().
    end method.
    
    method public void islipkIsLifto():
        busena = KeleivioBusena:pastate.        
    end method.    

end class.