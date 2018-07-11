USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS kLiftas INHERITS liftas: 

    define public property minApkrova as integer no-undo get.
    public set.

		
	CONSTRUCTOR PUBLIC kLiftas ( INPUT iAukstuSk AS INTEGER ):
		SUPER (INPUT iAukstuSk).
		keliamojiGalia = 1000.
		minApkrova = 100.
		greitis = 5.
		liftoNr = 2.
		
	END CONSTRUCTOR.

	METHOD OVERRIDE PUBLIC VOID baigiaDarba(  ):
		
		SUPER:baigiaDarba().

	END METHOD.

	METHOD OVERRIDE PUBLIC Progress.Lang.Object Clone(  ):
		
		RETURN SUPER:Clone().

	END METHOD.

	METHOD OVERRIDE PUBLIC VOID durysAtsidaro(  ):
		
		SUPER:durysAtsidaro().

	END METHOD.

	METHOD OVERRIDE PUBLIC VOID durysUzsidaro(  ):
		
		SUPER:durysUzsidaro().

	END METHOD.

	METHOD OVERRIDE PUBLIC LOGICAL Equals( INPUT objectRef AS Progress.Lang.Object ):
		
		RETURN SUPER:Equals(INPUT objectRef).

	END METHOD.

	METHOD OVERRIDE PUBLIC Progress.Lang.Class GetClass(  ):
		
		RETURN SUPER:GetClass().

	END METHOD.

	METHOD OVERRIDE PUBLIC LOGICAL svorisTinkamas( INPUT keleivis AS IKeleivis ):
		
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

	END METHOD.

	METHOD OVERRIDE PUBLIC CHARACTER ToString(  ):
		
		RETURN SUPER:ToString().

	END METHOD.

	METHOD OVERRIDE PUBLIC VOID vaziuoja( INPUT iAukstas AS INTEGER, INPUT busena AS liftoBusena ):
		
		SUPER:vaziuoja(INPUT iAukstas, INPUT busena).

	END METHOD.

	METHOD OVERRIDE PUBLIC VOID vaziuoja( INPUT keleivis AS IKeleivis ):
		
		SUPER:vaziuoja(INPUT keleivis).

	END METHOD.

END CLASS.