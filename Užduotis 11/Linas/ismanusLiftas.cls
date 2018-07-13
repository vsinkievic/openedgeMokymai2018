 
using Progress.Lang.*.

block-level on error undo, throw.


class ismanusLiftas inherits liftas: 

	define public property minApkrova as integer get. set.
    define variable iTrukme as integer no-undo.
    define variable art as ismanusLiftas.	
    define variable aukstas as integer no-undo.
		
	constructor public ismanusLiftas (input iAukstuSk as integer, input iGalia as integer, 
	   input iGreitis as integer ):
		super (input iAukstuSk, input iGalia, input iGreitis).
		minApkrova = 20.
	end constructor.

    method public ismanusLiftas artimesnis(liftas1 as ismanusLiftas, liftas2 as ismanusLiftas, aukstas as integer):
        if liftas1:laukimoTrukme(liftas1:dabAukstas, aukstas) <=
           liftas2:laukimoTrukme (liftas2:dabAukstas, aukstas)
        then art = liftas1.
        else art = liftas2.
        return art.
    end.

    method public integer laukimoTrukme(aukstas1 as integer, aukstas2 as integer):
        iTrukme = this-object:greitis * absolute(aukstas1 - aukstas2).
        put unformatted substitute("Numatoma lifto Nr.&1 laukimo trukmë yra &2 sek.", 
            this-object:nr, iTrukme) skip.
        return iTrukme.
    end.

    method override public logical svorisTinkamas(input keleivis as IKeleivis ):
        
       put unformatted "Liftas tikrina keleivio svorá." skip.
            if keleivis:svoris < this-object:keliamojiGalia or 
                keleivis:svoris > this-object:minApkrova
            then do:
               put unformatted "Keleivio svoris leistinas, galima vaþiuoti." skip.
               return true.
            end.
            else do:
               put unformatted "Keleivio svoris netinkamas, vaþuoti neleidþiama." skip.
               return false.
            end.

    end method.


end class.