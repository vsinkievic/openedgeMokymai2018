routine-level on error undo, throw.

class liftas:
    
    define public property dabAukstas as integer no-undo get.
    public set.
    define public property durysAtidarytos as log no-undo get.
    private set.
    define public property suKeleiviu as log no-undo get.
    public set.
    define public property aukstuSk as integer no-undo get.
    public set.
    define public property keliamojiGalia as integer no-undo get.
    public set.
    define public property greitis as integer no-undo get.
    public set.
    define public property nr as integer no-undo get. set.
    
    define variable iAukstuSk as integer no-undo.
    define variable iAukstas as integer no-undo.
    define variable iTrukme as integer no-undo.
    define variable iGalia as integer no-undo.
    define variable iGreitis as integer no-undo.
    define public static variable liftuSkaicius as integer init 0 no-undo.
    
    constructor public liftas(iAukstuSk as integer, iGalia as integer, iGreitis as integer):
        dabAukstas = random(1, iAukstuSk).
        durysAtidarytos = false.
        aukstuSk = iAukstuSk.
        liftas:liftuSkaicius = liftas:liftuSkaicius + 1.
        nr = liftas:liftuSkaicius.
        keliamojiGalia = iGalia.
        greitis = iGreitis.
    end.

    method public void liftoStatusas():
        put unformatted substitute("Pastate yra liftas Nr. &1, kurio keliamoji galia yra &2 kg.", 
            nr, keliamojiGalia) skip.
        put unformatted substitute("Liftas Nr.&1 ðiuo metu yra &2 aukðte.", nr,
            dabAukstas) skip.
    end.

    
    method public void vaziuoja(iAukstas as integer, busena as liftoBusena):
        if busena = liftoBusena:suKeleiviu then durysUzsidaro().
        put unformatted substitute("Liftas Nr.&3 vaþiuoja ið &1 á &2 aukðtà", 
            this-object:dabAukstas, iAukstas, this-object:nr) skip.
        this-object:dabAukstas = iAukstas.
        durysAtsidaro().
    end.
    
    method public void vaziuoja(keleivis as IKeleivis):
        if svorisTinkamas(keleivis)
        then do:
            durysUzsidaro().
            put unformatted substitute("Liftas ir keleivis vaþiuoja ið &1 á &2 aukðtà.", 
                this-object:dabAukstas, keleivis:tikslas) skip.
            this-object:dabAukstas = keleivis:tikslas.
            keleivis:dabAukstas = keleivis:tikslas.
            durysAtsidaro().
        end.
    end.
    
    
    method public void durysUzsidaro():
        put unformatted "Durys uþsidaro." skip.
        durysAtidarytos = false.
    end.
    
    method public void durysAtsidaro():
        put unformatted "Durys atsidaro." skip.
        durysAtidarytos = true.
    end.
    
    method public void baigiaDarba():
        durysUzsidaro().
        put unformatted substitute("Liftas Nr.&2 baigia darbà &1 aukðte.", 
            this-object:dabAukstas, this-object:nr) skip.
    end.

    method public log svorisTinkamas(keleivis as IKeleivis):
        put unformatted "Liftas tikrina keleivio svorá." skip.
        if keleivis:svoris < this-object:keliamojiGalia 
        then do:
            put unformatted "Keleivio svoris leistinas, galima vaþiuoti." skip.
            return true.
        end.
        else do:
            put unformatted "Keleivio svoris netinkamas, vaþuoti neleidþiama." skip.
            return false.
        end.
    end.
    

end.