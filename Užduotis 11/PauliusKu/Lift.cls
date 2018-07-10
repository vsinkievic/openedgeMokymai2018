 
 /*------------------------------------------------------------------------
    File        : Lift
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Tue Jul 10 15:56:58 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Lift: 
	
	DEFINE VARIABLE clift_state AS CHARACTER NO-UNDO.
	DEFINE VARIABLE clift_door_state AS CHARACTER NO-UNDO.
	DEFINE VARIABLE ilift_dest AS INTEGER NO-UNDO.
	DEFINE VARIABLE ilift_current_pos AS INTEGER NO-UNDO.
		
	CONSTRUCTOR PUBLIC Lift ():
	    
		clift_state = "Laisvas".
		clift_door_state = "Uzdarytos".
		ilift_dest = ?.
		ilift_current_pos = 1.
	END CONSTRUCTOR.
	
	METHOD PRIVATE VOID Open_lift_door ():
	    clift_door_state = "Atidarytos".
	END METHOD.
	
	METHOD PRIVATE VOID Close_lift_door ():
        clift_door_state = "Uzdarytos".
    END METHOD.  
    
    METHOD PUBLIC CHARACTER Get_lift_door_state():
        RETURN clift_door_state.
    END METHOD.
    
    METHOD PUBLIC INTEGER Get_lift_current_pos():
        RETURN ilift_current_pos.
    END METHOD.

    METHOD PUBLIC VOID Moving_lift (dest AS INTEGER):
        
        Set_clift_state_to_uzimtas().
        Close_lift_door().
        
        DEFINE VARIABLE i AS INTEGER NO-UNDO.
        IF dest > ilift_current_pos
        THEN DO:
            DO WHILE ilift_current_pos <> dest:
                ilift_current_pos = ilift_current_pos + 1.
            END.    
        END.
        ELSE IF dest < ilift_current_pos
        THEN DO:
            DO WHILE ilift_current_pos <> dest:
                ilift_current_pos = ilift_current_pos - 1.
            END.    
        END.
        ELSE DO:
            
        END.
        
        Open_lift_door().
        Set_clift_state_to_laisvas().        
        
    END METHOD.
    
    METHOD PUBLIC VOID Moving_lift (dest AS INTEGER, pass AS Passenger):
        
        Close_lift_door().
        
        DEFINE VARIABLE i AS INTEGER NO-UNDO.
        IF dest > ilift_current_pos
        THEN DO:
            DO WHILE ilift_current_pos <> dest:
                ilift_current_pos = ilift_current_pos + 1.
                pass:Move_up_or_down(TRUE).
            END.    
        END.
        ELSE IF dest < ilift_current_pos
        THEN DO:
            DO WHILE ilift_current_pos <> dest:
                ilift_current_pos = ilift_current_pos - 1.
                pass:Move_up_or_down(FALSE).
            END.    
        END.
        ELSE DO:
            
        END.
        
        Open_lift_door(). 
        
    END METHOD.    
    
    METHOD PUBLIC VOID may_move_to_passenger(dest AS INTEGER):
        IF clift_state = "Uzimtas"
        THEN DO:
            MESSAGE "Liftas yra uzimtas".
        END.
        ELSE Moving_lift(dest).
    END METHOD.    
    

    METHOD PUBLIC VOID Print_lift_data ():
        
        MESSAGE clift_state
                clift_door_state
                ilift_dest
                ilift_current_pos.        
    END METHOD.
    
    METHOD PUBLIC VOID Set_clift_state_to_uzimtas():
        clift_state = "Uzimtas".
    END METHOD. 
    
    METHOD PUBLIC VOID Set_clift_state_to_laisvas():
        clift_state = "Laisvas".
    END METHOD.    
END CLASS.