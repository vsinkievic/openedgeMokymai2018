 
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

class KeleivisBeVardo implements IKeleivis: 
    
	define public property svoris as integer no-undo get. set(i as int): end.
	def var keleivis as Keleivis no-undo.
    
    constructor KeleivisBeVardo(svoris as integer, esamasAukstas as integer ):
        keleivis = new Keleivis(svoris, esamasAukstas).
        
    end constructor.

	method public void iskvieskLifta( input liftas as Liftas ):
		keleivis:iskvieskLifta(liftas).
		put unformatted substitute ("Keleivis iðkvietë liftà bûdamas &1 aukðte.", keleivis:getEsamasAukstas()) skip.
       	end method.
       	
	method public void islipkIsLifto(  ):
		keleivis:islipkIsLifto().
		put unformatted substitute ("Keleivis iðlipa ið lifto.") skip.
        
	end method.
	
	method public void persikelkIKitaAuksta( input liftas as Liftas, input tikslas as integer ):
	    keleivis:persikelkIKitaAuksta(liftas, tikslas).
		put unformatted substitute ("Keleivis álipa á liftà.") skip.
        if liftas:patikrinkSvori(keleivis:getSvoris())
        then do:
            put unformatted substitute ("Keleivis nori vaþiuoti á &1 aukðtà.", tikslas) skip.
        end.
        else do:
            put unformatted substitute("Keleivis netenkina leistino lifto svorio, tad turi iðlipti.") skip.
        end.
       
	end method.    
    

end class.