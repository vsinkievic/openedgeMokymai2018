 
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

block-level on error undo, throw.

class uzduotis11.keleivis: 
    
   
 
    define public property keleivioBusena as character no-undo get. set.
    define public property keleivioSvoris as integer no-undo get. set.
    define public property esamasAukstas as integer no-undo get. set.
    define public property norimasAukstas as integer no-undo get. set.
    
    define variable liftas1 as class liftas no-undo.
    
    constructor keleivis(keleivioBusena as character, keleivioSvoris as integer, esamasAukstas as integer):
        assign
           this-object:keleivioBusena = keleivioBusena
           this-object:keleivioSvoris = keleivioSvoris
           this-object:esamasAukstas = esamasAukstas.
    end constructor.    
    
    method public void kvieskLifta():
/*        liftas1 = new liftas(true, 100, false, 1).*/
        message "iskvieciau".
        keleivioBusena = "Keleivis laukia".
        message keleivioBusena.
/*        liftas1:atidarykDuris().*/
    end method.    
    
    method public void ilipk():
        message "Ilipau i lifta".
        keleivioBusena = "Keleivis Lifte".
        message keleivioBusena.
    end method.    
    
     method public void islipk():
        message "Islipau is lifto".
        keleivioBusena = "Keleivis pastate".
        message keleivioBusena.
    end method.  

end class.