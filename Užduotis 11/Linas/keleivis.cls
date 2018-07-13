routine-level on error undo, throw.


class keleivis implements IKeleivis:
    
    define public property dabAukstas as integer no-undo get.
    public set.
    define public property tikslas as integer no-undo get.
    public set.
    define public property lifte as log no-undo get.
    public set.
    define public property svoris as integer no-undo get.
    public set.
    define variable iA as integer no-undo.
    
    constructor keleivis():
        lifte = false.
        svoris = random(40, 120).
    end.
    
    method public void kviecia(liftas as liftas):
        do while dabAukstas <= 0 or dabAukstas > liftas:aukstuSk:
            update dabAukstas help "Kuriame aukðte esate?" no-labels.
            if dabAukstas <= 0 or dabAukstas > liftas:aukstuSk then message 
                "Galimas aukðtø pasirinkimas: nuo 1 iki" liftas:aukstuSk view-as alert-box.
        end.
    end.
    
    method public void kviecia(liftas1 as ismanusLiftas, liftas2 as ismanusLiftas):
         do while dabAukstas <= 0 or dabAukstas > liftas1:aukstuSk:
            update dabAukstas help "Kuriame aukðte esate?" no-labels.
            if dabAukstas <= 0 or dabAukstas > liftas1:aukstuSk then message 
                "Galimas aukðtø pasirinkimas: nuo 1 iki" liftas1:aukstuSk view-as alert-box.
        end.
    end.
    
    method public integer pasirenkaAuksta(aukstuSk as integer):
        do while iA <= 0 or iA > aukstuSk or iA = this-object:dabAukstas:
            update iA help "Á kurá aukðtà norite nuvaþiuoti?" no-labels.
            if iA <= 0 or iA > aukstuSk then message 
            "Galimas aukðtø pasirinkimas: nuo 1 iki" aukstuSk view-as alert-box.
            if iA = this-object:dabAukstas then message 
            substitute("Jûs jau esate &1 aukðte", iA) view-as alert-box.
        end.
        this-object:tikslas = iA.
        return this-object:tikslas.
    end.
    
    method public void ilipa():
        this-object:lifte = true.
    end.
    method public void islipa():
        this-object:lifte = false.
    end.

    method public void vaziuoja():
        this-object:dabAukstas = this-object:tikslas.
    end.
    
    method public integer getDabAukstas():
        return this-object:dabAukstas.
    end.
    
    method public integer getTikslas():
        return this-object:tikslas.
    end.
    
end.
    
    
