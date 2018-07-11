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
    define public variable liftoNr as integer no-undo init 0.
    
    define variable iAukstuSk as integer no-undo.
    define variable iAukstas as integer no-undo.
    define variable iTrukme as integer no-undo.
    
    constructor public liftas(iAukstuSk as integer):
        dabAukstas = random(1, iAukstuSk).
        durysAtidarytos = false.
        aukstuSk = iAukstuSk.
        keliamojiGalia = 100.
        greitis = 3.
        liftoNr = 1.
    end.

    method public void liftoStatusas():
        put unformatted substitute("Pastate yra liftas Nr. &1, kurio keliamoji galia yra &2 kg.", 
            liftoNr, keliamojiGalia) skip.
        put unformatted substitute("Liftas Nr.&1 ðiuo metu yra &2 aukðte.", liftoNr,
            dabAukstas) skip.
    end.

    
    method public void vaziuoja(iAukstas as integer, busena as liftoBusena):
        if busena = liftoBusena:suKeleiviu then durysUzsidaro().
        put unformatted substitute("Liftas Nr.&3 vaþiuoja ið &1 á &2 aukðtà", 
            this-object:dabAukstas, iAukstas, this-object:liftoNr) skip.
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
            this-object:dabAukstas, this-object:liftoNr) skip.
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
    
    method public integer laukimoTrukme(aukstas1 as integer, aukstas2 as integer):
        iTrukme = this-object:greitis * absolute(aukstas1 - aukstas2).
        put unformatted substitute("Numatoma lifto Nr.&1 laukimo trukmë yra &2 sek.", 
            this-object:liftoNr, iTrukme) skip.
        return iTrukme.
    end.

end.