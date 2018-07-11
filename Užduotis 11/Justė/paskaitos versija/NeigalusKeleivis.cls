 
 /*------------------------------------------------------------------------
    File        : NeigalusKeleivis
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Wed Jul 11 12:51:16 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.

block-level on error undo, throw.

class NeigalusKeleivis implements IKeleivis: 
    
    
	define public property svoris as integer no-undo 
	get():
		undo, throw new Progress.Lang.AppError("Property getter for svoris has not been implemented").
	end get.
	set(input arg as integer):
		undo, throw new Progress.Lang.AppError("Property setter for svoris has not been implemented").		
	end set.
	 

	method public void iskvieskLifta( input liftas as Liftas ):
		
		undo, throw new Progress.Lang.AppError("METHOD NOT IMPLEMENTED").

	end method.

	method public void islipkIsLifto(  ):
		
		undo, throw new Progress.Lang.AppError("METHOD NOT IMPLEMENTED").

	end method.

	method public void persikelkIKitaAuksta( input liftas as Liftas, input tikslas as integer ):
		
		undo, throw new Progress.Lang.AppError("METHOD NOT IMPLEMENTED").

	end method.

end class.