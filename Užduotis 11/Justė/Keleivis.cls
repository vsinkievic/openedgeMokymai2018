using Progress.Lang.*.

block-level on error undo, throw.

class Keleivis: 
    
    define variable busena as KeleivioBusena no-undo.
    define public property svoris as integer no-undo get. set.
    define variable tikslas as integer no-undo.
    define variable esamasAukstas as integer no-undo.
    define variable laukimoLaikas as integer no-undo.
    
    constructor keleivis(svoris as integer, esamasAukstas as integer):
        this-object:svoris = svoris.
        this-object:esamasAukstas = esamasAukstas.
        busena = KeleivioBusena:pastate.
        laukimoLaikas = 0.
    end constructor.
    
    method public void iskvieskLifta(liftas as Liftas):
        put unformatted substitute  ("Keleivis iðkvietë liftà bûdamas &1 aukðte.", esamasAukstas) skip.
        laukimoLaikas = liftas:atvaziuok(esamasAukstas).
        if laukimoLaikas <> 0 
        then busena = KeleivioBusena:laukia.
        liftas:atidarykDuris().
    end method.
    
    method public void persikelkIKitaAuksta(liftas as Liftas, tikslas as integer):
        this-object:tikslas = tikslas.
        iskvieskLifta(liftas).
        put unformatted "Keleivis álipa á liftà." skip.
        busena = KeleivioBusena:lifte.
        liftas:uzdarykDuris().
        if liftas:patikrinkSvori(svoris)
        then do:
            liftas:vezkKeleivi(tikslas).
            esamasAukstas = tikslas.
        end.
        else do:
            put unformatted "Keleivis netenkina leistino lifto svorio, tad turi iðlipti." skip.
        end.
        liftas:atidarykDuris().
            islipkIsLifto().
            liftas:atsilaisvink().
            liftas:uzdarykDuris().
    end method.
    
    method public void islipkIsLifto():
        put unformatted "Keleivis iðlipa ið lifto." skip.
        busena = KeleivioBusena:pastate.        
    end method.    

end class.