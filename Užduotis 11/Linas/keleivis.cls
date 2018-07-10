routine-level on error undo, throw.

class keleivis:
    
    define public property dabAukstas as integer no-undo get.
    private set.
    define public property tikslas as integer no-undo get.
    private set.
    define public property lifte as log no-undo get.
    private set.
    define variable iAukstas as integer no-undo.
    define variable iA as integer no-undo.
    
    constructor keleivis():
        lifte = false.
    end.
    
    method public integer kviecia(aukstuSk as integer):
        do while dabAukstas <= 0 or dabAukstas > aukstuSk:
            update dabAukstas help "Kuriame aukðte esate?".
            if dabAukstas <= 0 or dabAukstas > aukstuSk then message 
                "Galimas aukðtø pasirinkimas: nuo 1 iki" aukstuSk view-as alert-box.
        end.
        return dabAukstas.
    end.
    
    method public integer pasirenkaAuksta(aukstuSk as integer):
        do while iA <= 0 or iA > aukstuSk or iA = this-object:dabAukstas:
            update iA help "Á kurá aukðtà norite nuvaþiuoti?".
            if iA <= 0 or iA > aukstuSk then message 
            "Galimas aukðtø pasirinkimas: nuo 1 iki" aukstuSk view-as alert-box.
            if iA = this-object:dabAukstas then message 
            substitute("Jûs jau esate &1 aukðte", iA) view-as alert-box.
        end.
        this-object:tikslas = iA.
        message substitute("Keleivis pasirinko vaþiuoti ið &1 á &2 aukðtà", 
            this-object:dabAukstas, this-object:tikslas).
        this-object:vaziuoja().
        return this-object:tikslas.
    end.
    
    method public void ilipa():
        this-object:lifte = true.
        message "Keleivis áëjo á liftà".
    end.
    method public void islipa():
        this-object:lifte = false.
        message "Keleivis iðlipo ið lifto".
    end.

    method public void vaziuoja():
        this-object:dabAukstas = this-object:tikslas.
    end.
    
end.
    
    
