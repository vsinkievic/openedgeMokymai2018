routine-level on error undo, throw.

using keleivis.*.
using pastatas.*.
using liftas.*.

class kelioneLiftu:
    
    define public property pPastatas as class pastatas no-undo get.
    private set.
    define public property pLiftas as class liftas no-undo get.
    private set.
    define public property pKeleivis as class keleivis no-undo get.
    private set.
    define variable iAukstas as integer no-undo.
    
    constructor kelioneLiftu():
        pPastatas = new pastatas().
        pKeleivis = new keleivis().
        pLiftas = new liftas(this-object:pPastatas:aukstuSk).
    end.

    method public void vykdyti():
        kelionesPradzia().
        keleivisLifte().
        kelionesPabaiga().
    end.
    
    method public void kelionesPradzia():
        iAukstas = pKeleivis:kviecia(pPastatas:aukstuSk).
        pLiftas:vaziuoja(iAukstas, false).
        pKeleivis:ilipa().
        pLiftas:suKeleiviu = true.
    end.

    method public void keleivisLifte():
        iAukstas = pKeleivis:pasirenkaAuksta(pPastatas:aukstuSk).
        liftasVaziuojaSuKeleiviu(iAukstas).
    end.
    
    method public void kelionesPabaiga():
        pKeleivis:islipa().
        pLiftas:baigiaDarba().
    end.
    
    method public void liftasVaziuojaSuKeleiviu(iAukstas as integer):
        pLiftas:durysUzsidaro().
        message substitute("liftas ir keleivis vaþiuoja ið &1 á &2 aukðtà", 
            pLiftas:dabAukstas, iAukstas).
        pKeleivis:dabAukstas = pKeleivis:tikslas.
        pLiftas:dabAukstas = iAukstas.
        pLiftas:durysAtsidaro().
    end.
    
end.