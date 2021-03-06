Using progress.lang.*.

block-level on error undo, throw.

class keleivis:

    define public property keleivio_busena as logical no-undo get. /*true - keleivis lifte, false - keleivis ne lifte*/
    private set.
    define public property ssvoris as integer no-undo get.
    private set.
    define public property ttikslas as integer no-undo get.
    set.
    define public property aAukstas as integer no-undo get.
    set.
    define public property max_Svoris as integer no-undo get.
    set.
    
    define variable svoris as decimal no-undo.
    define variable pasirinktas_aukstas as integer no-undo.
    define variable esamas_aukstas as integer no-undo.
    
    constructor public keleivis ():
        keleivio_busena = false.
        max_svoris = 100.
        
        update svoris label "J�s� svoris" esamas_aukstas label "Dabartinis auk�tas" pasirinktas_aukstas label "Pasirinktas auk�tas".
        if svoris > max_Svoris
            then message "J�s� svoris (" svoris ") per didelis. Maksimalus leistinas svoris yra (" max_Svoris ")" view-as alert-box.
        else assign
            sSvoris = svoris.
            aAukstas = esamas_aukstas.
            tTikslas = pasirinktas_aukstas.
    end constructor.
        
    method public integer iskvieskLifta ():
        message "Klientas i�sikviet� lift� � " aAukstas " auk�t�" view-as alert-box.
        return aaukstas.
    end method.
end class.