 
 /*------------------------------------------------------------------------
    File        : keleivisSuVardu
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Wed Jul 11 11:43:36 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.

block-level on error undo, throw.

class keleivisSuVardu implements IKeleivis: 
    
    
    
    define property svoris as decimal no-undo get. set.
    def var keleivis as Keleivis no-undo.
    define public property vardas as character no-undo get. set.
    
    constructor keleivisSuVardu(vardas as character):
           keleivis = new Keleivis().
           this-object:vardas = vardas.
           message vardas view-as alert-box.
    end constructor.
    
    method public integer getEsamasAukstas():
    end method.

    method public integer getTikslas():
    end method.

    method public decimal  getSvoris():
    end method.
    
    method public integer getlaukimoLaikas():
    end method.

    method public void iskvieskLifta(liftas as Liftas):
        keleivis:iskvieskLifta(liftas).
        put unformatted substitute("&2 iðkvietë liftà á &1 aukðtà", keleivis:getEsamasAukstas(), vardas) skip(1).
        put unformatted substitute("Liftas vaþiavo &1 sekundþiø",keleivis:getlaukimoLaikas()) skip(1).
        
    end method.
    
    
    method public void persikelkIKitaAuksta(liftas as Liftas):
        keleivis:persikelkIKitaAuksta(liftas).
        
       
        if liftas:patikrinkSvori(keleivis:getSvoris())
            then do:
                //put unformatted substitute("Liftas vaþiavo &1 sekundþiø",liftas:atvaziuok(keleivis:getTikslas())) skip(1).
            end.
        else put unformatted substitute("Ei &1, numesk svorio, neatitinki svorio limito, iðlipk!",vardas).

    end method.
        
    
    
    
    method public void KeleivisIlipaILifta():
        put unformatted substitute("&1", vardas).
        keleivis:KeleivisIlipaILifta().
                //put unformatted substitute("&1 ilipa á liftà", vardas) skip(1).
          
    end method.
    
    method public void KeleivisIslipaIsLifto():
        put unformatted substitute("&1", vardas).
         keleivis:KeleivisIslipaIsLifto().
                //put unformatted substitute("&1 iðlipa ið lifto", vardas) skip(1).
    
    end method.
    
    
end class.