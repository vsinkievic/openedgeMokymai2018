 
 /*------------------------------------------------------------------------
    File        : KeleivisSuVardu
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Wed Jul 11 11:43:33 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.

block-level on error undo, throw.

class KeleivisSuVardu implements IKeleivis: 
    
	define public property svoris as integer no-undo get. set(i as int): end.
	def var keleivis as Keleivis no-undo.
    define public property vardas as character no-undo get. set.
    
    constructor KeleivisSuVardu(svoris as integer, esamasAukstas as integer ,vardas as character):
        keleivis = new Keleivis(svoris, esamasAukstas).
        this-object:vardas = vardas.
    end constructor.

	method public void iskvieskLifta( input liftas as Liftas ):
		keleivis:iskvieskLifta(liftas).
		put unformatted substitute ("&1 iðkvietë liftà bûdamas &2 aukðte.", vardas, keleivis:getEsamasAukstas()) skip.
       	end method.
       	
	method public void islipkIsLifto(  ):
		keleivis:islipkIsLifto().
		put unformatted substitute ("&1 iðlipa ið lifto.", vardas) skip.
        
	end method.
	
	method public void persikelkIKitaAuksta( input liftas as Liftas, input tikslas as integer ):
	    keleivis:persikelkIKitaAuksta(liftas, tikslas).
		put unformatted substitute ("&1 álipa á liftà.", vardas) skip.
        if liftas:patikrinkSvori(keleivis:getSvoris())
        then do:
            put unformatted substitute ("&2 nori vaþiuoti á &1 aukðtà.", tikslas, vardas) skip.
        end.
        else do:
            put unformatted substitute("&1 netenkina leistino lifto svorio, tad turi iðlipti.",vardas) skip.
        end.
       
	end method.    
    

end class.