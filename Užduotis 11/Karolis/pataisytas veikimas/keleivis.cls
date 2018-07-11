 
 /*------------------------------------------------------------------------
    File        : keleivis
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Tue Jul 10 15:33:25 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/
using uzduotis11.liftas from propath.
using Progress.Lang.*.
using uzduotis11.keleivioBusena from propath.
using uzduotis11.Ikeleivis from propath.

block-level on error undo, throw.

class uzduotis11.keleivis implements Ikeleivis: 
    
   
 
    define public property busena as keleivioBusena no-undo get. set.
    define public property keleivioSvoris as integer no-undo get. set.
    define public property esamasAukstas as integer no-undo get. set.
    define public property norimasAukstas as integer no-undo get. set.
    
    
    constructor keleivis(keleivioSvoris as integer, esamasAukstas as integer):
        assign
           this-object:busena = keleivioBusena:pastate
           this-object:keleivioSvoris = keleivioSvoris
           this-object:esamasAukstas = esamasAukstas.
    end constructor.    
    
    method public void kvieskLifta(liftas as liftas, norimasAukstas as integer):
        
        this-object:norimasAukstas = norimasAukstas.
        message "Iðkvieèiau".
        busena = keleivioBusena:laukia.
        liftas:vaziuokPasKlienta(this-object).
               
    end method.    
    
    method public void kelkisSuLiftu(liftas as liftas):
        
        busena = keleivioBusena:lifte. 
        liftas:vezkKlienta(this-object).
 
    end method.    
    
    method public void islipk():
        message "Iðlipau ið lifto".
        busena = keleivioBusena:pastate.
    end method.  
    
    method public void ilipk(liftas as liftas):
        message "Álipau á liftà".
        busena = keleivioBusena:lifte.
    end method.  

end class.