 
 /*------------------------------------------------------------------------
    File        : Building
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Tue Jul 10 16:31:51 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Building: 
    
    DEFINE VARIABLE floors AS INTEGER NO-UNDO.
    //DEFINE VARIABLE lift AS CLASS Lift NO-UNDO.
    
	CONSTRUCTOR PUBLIC Building (  ):
		floors = 10.
		
	END CONSTRUCTOR.
	
	METHOD PUBLIC INTEGER Get_floors():
	    RETURN floors.
	END METHOD.    

END CLASS.