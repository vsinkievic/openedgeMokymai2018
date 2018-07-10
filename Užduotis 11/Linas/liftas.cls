routine-level on error undo, throw.

class liftas:
    
    define public property dabAukstas as integer no-undo get.
    public set.
    define public property durysAtidarytos as log no-undo get.
    private set.
    define public property suKeleiviu as log no-undo get.
    public set.
    define variable iAukstuSk as integer no-undo.
    define variable iAukstas as integer no-undo.
    define variable lSuKeleiviu as log no-undo.
    
    constructor liftas(iAukstuSk as integer):
        dabAukstas = random(1, iAukstuSk).
        durysAtidarytos = false.
    end.
    
    method public void vaziuoja(iAukstas as integer, lSuKeleiviu as log):
        if lSuKeleiviu then durysUzsidaro().
        message substitute("liftas vaþiuoja ið &1 á &2 aukðtà", this-object:dabAukstas, iAukstas).
        this-object:dabAukstas = iAukstas.
        durysAtsidaro().
    end.
    
    method public void durysUzsidaro():
        message "Durys uþsidaro".
        durysAtidarytos = false.
    end.
    
    method public void durysAtsidaro():
        message "Durys atsidaro".
        durysAtidarytos = true.
    end.
    
    method public void baigiaDarba():
        durysUzsidaro().
        message "Liftas baigia darbà".
    end.
    

end.