 
 /*------------------------------------------------------------------------
    File        : Passenger_guest
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Wed Jul 11 16:27:14 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING enum.Passenger_control_status FROM PROPATH.
USING interface.I_Lift FROM PROPATH.
USING class.Building FROM PROPATH.
USING enum.Lift_door_state FROM PROPATH.
USING enum.Lift_state FROM PROPATH.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS class.Passenger_root IMPLEMENTS I_Passenger: 

	DEFINE PUBLIC PROPERTY ePass_control_status AS Passenger_control_status 
	GET.
	SET. 

	DEFINE PUBLIC PROPERTY ePass_state AS Passenger_state 
	GET.
	SET. 

	DEFINE PUBLIC PROPERTY iPass_current_lift_id AS INTEGER  
	GET.
	SET. 

	DEFINE PUBLIC PROPERTY iPass_current_pos AS INTEGER  
	GET.
	SET. 

	DEFINE PUBLIC PROPERTY iPass_mass AS INTEGER  
	GET.
	SET. 

    CONSTRUCTOR PUBLIC Passenger_root (mass AS INTEGER):
        ePass_control_status = Passenger_control_status:svecias.
        ePass_state = Passenger_state:pastate.
        iPass_current_lift_id = ?.
        iPass_current_pos = 1.
        iPass_mass = mass.
        
    END CONSTRUCTOR.    
    
	METHOD PUBLIC VOID Call_lift( INPUT lift AS I_Lift ):
		
        IF ePass_state = Passenger_state:lifte
        THEN DO:
            MESSAGE "Lifte negalima iskviesti lifto".
            
        END.
        ELSE DO:
            lift:move_lift(iPass_current_pos).
            ePass_state = Passenger_state:laukia.
        END.

	END METHOD.

	METHOD PUBLIC LOGICAL Order_lift_to_go(lift AS I_Lift, building AS Building, dest AS INTEGER ):
		
            IF ePass_state = Passenger_state:lifte AND iPass_current_lift_id = lift:iLift_ID
            THEN DO:
                
                lift:move_lift_with_pass(THIS-OBJECT, dest).
            END.
            ELSE DO:
                MESSAGE "As nesu tame lifte".
            END.

	END METHOD.

	METHOD PUBLIC LOGICAL Step_into(lift AS I_Lift ):
		
		lift:Print_data().
        MESSAGE iPass_current_pos lift:iLift_current_pos.
        MESSAGE lift:eLift_door_state.
        IF ePass_state = Passenger_state:lifte
        THEN DO:
            MESSAGE "As jau lifte".
            RETURN FALSE.
        END.
        ELSE DO:
            IF iPass_current_pos     = lift:iLift_current_pos AND 
               lift:eLift_door_state = Lift_door_state:atidarytos
            THEN DO:
                ePass_state = Passenger_state:lifte.
                lift:eLift_state = Lift_state:uzimtas.
                iPass_current_lift_id = lift:iLift_ID.
                MESSAGE "Ilipau i lifta".
                RETURN TRUE.
                
            END.
            ELSE DO:
                MESSAGE "lifto nera arba durys yra uzdarytos".
                RETURN FALSE.
            END.   
         
        END. 

	END METHOD.

	METHOD PUBLIC LOGICAL Step_out( INPUT lift AS I_Lift ):
		
        IF ePass_state = Passenger_state:lifte AND iPass_current_lift_id = lift:iLift_ID
        THEN DO:
            IF lift:eLift_door_state = Lift_door_state:atidarytos
            THEN DO:
                ePass_state = Passenger_state:pastate.
                lift:eLift_state = Lift_state:laisvas.
                iPass_current_lift_id = ?.
                MESSAGE "Islipau is lifto".
                RETURN TRUE.
            END.
            ELSE DO:
                MESSAGE "Lifto durys uzdarytos".
                RETURN FALSE.
            END.        
        END.
        ELSE DO:
            MESSAGE "As nesu tame lifte".
            RETURN FALSE.
        END.   

	END METHOD.

    METHOD PUBLIC VOID Print_data ():
        
        MESSAGE ePass_state
                iPass_current_lift_id
                iPass_current_pos
                iPass_mass.
        
    END METHOD.    

END CLASS.