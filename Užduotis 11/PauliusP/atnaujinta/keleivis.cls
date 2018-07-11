Using progress.lang.*.
using src.keleivioBusena from propath.

block-level on error undo, throw.

class keleivis implements IKeleivis:

    define variable keleivio_busena as src.keleivioBusena no-undo.
    define public property svoris as integer no-undo get.
    set.
    define public property tikslas as integer no-undo get.
    set.
    define public property esamas_aukstas as integer no-undo get.
    set.  

    constructor public keleivis (input esamas_aukstas as integer, input pasirinktas_aukstas as integer, input svoris as decimal):
        keleivio_busena = keleivioBusena:pastate.
        this-object:esamas_aukstas = esamas_aukstas.
        this-object:svoris = svoris.
        this-object:tikslas = pasirinktas_aukstas.
    end constructor.
        
    method public integer iskvieskLifta (as_liftas as class liftas):
        as_liftas:atvaziuok(esamas_aukstas).
    end method.
    
    method public integer aukstoPakeitimas (as_liftas as liftas, as_pastatas as pastatas):
        keleivio_busena = keleivioBusena:pastate.
        iskvieskLifta(as_liftas).
        ilipk().
        as_liftas:vaziuok(tikslas, svoris, as_pastatas:maxKeliamasSvoris).
        esamas_aukstas = as_liftas:dabartinis_aukstas.
        islipk().
    end method.
    
    method public void ilipk ():
        keleivio_busena = keleivioBusena:lifte.
        put unformatted "Keleivis álipo á liftà." skip(1).
    end method.
    
    method public void islipk ():
        keleivio_busena = keleivioBusena:pastate.
        put unformatted "Keleivis iðlipo ið lifto." skip(1).
    end method.
end class.