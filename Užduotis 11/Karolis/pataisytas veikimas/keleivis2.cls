 
 /*------------------------------------------------------------------------
    File        : keleivis2
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Wed Jul 11 16:24:47 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/
using uzduotis11.liftas from propath.
using Progress.Lang.*.
using uzduotis11.keleivioBusena from propath.
using uzduotis11.Ikeleivis from propath.
using Progress.Lang.*.
using uzduotis11.keleivis from propath.

block-level on error undo, throw.

class uzduotis11.keleivis2 implements Ikeleivis: 
    
    define public property busena as keleivioBusena no-undo get. set.
    define public property keleivioSvoris as integer no-undo get. set.
    define public property esamasAukstas as integer no-undo get. set.
    define public property norimasAukstas as integer no-undo get. set.
    define variable keleivis as keleivis no-undo.
    
     constructor keleivis2(keleivioSvoris as integer, esamasAukstas as integer):
        assign
           keleivis = new keleivis(keleivioSvoris,esamasAukstas).
    end constructor.    

	method public void ilipk( input liftas as uzduotis11.liftas ):
		
		message "Álipau á liftà".
        busena = keleivioBusena:lifte.

	end method.

	method public void islipk(  ):
		
	     message "Iðlipau ið lifto".
        busena = keleivioBusena:pastate.

	end method.

	method public void kelkisSuLiftu(liftas as liftas):
		
		 busena = keleivioBusena:lifte. 
         liftas:vezkKlienta(keleivis).

	end method.

	method public void kvieskLifta(liftas as liftas, norimasAukstas as integer):
		
	    keleivis:norimasAukstas = norimasAukstas.
        message "Iðkvieèiau".
        busena = keleivioBusena:laukia.
        liftas:vaziuokPasKlienta(keleivis).

	end method.

end class.