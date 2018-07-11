 
 /*------------------------------------------------------------------------
    File        : Lift_passenger
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Wed Jul 11 17:11:12 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING interface.I_Lift.
USING enum.Lift_door_state FROM PROPATH.
USING enum.Lift_state FROM PROPATH.
USING enum.Lift_type FROM PROPATH.
USING class.Building FROM PROPATH.
USING enum.Passenger_control_status FROM PROPATH.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS class.Lift_root IMPLEMENTS I_Lift: 

    DEFINE PUBLIC PROPERTY iLift_ID AS INTEGER  
    GET.
    SET. 
    
	DEFINE PUBLIC PROPERTY eLift_door_state AS Lift_door_state 
	GET.
	SET. 

	DEFINE PUBLIC PROPERTY eLift_state AS Lift_state 
	GET.
	SET. 

	DEFINE PUBLIC PROPERTY eLift_type AS Lift_type
	GET.
	SET. 

	DEFINE PUBLIC PROPERTY iLift_current_pos AS INTEGER  
	GET.
	SET. 
	
	DEFINE PUBLIC PROPERTY iLift_floor_ground_admin AS INTEGER
    GET.
    SET.

    DEFINE PUBLIC PROPERTY iLift_floor_ground AS INTEGER
    GET.
    SET.
    
    DEFINE PUBLIC PROPERTY iLift_floor_top AS INTEGER
    GET.
    SET. 

	DEFINE PUBLIC PROPERTY iLift_max_mass AS INTEGER  
	GET.
	SET.
	
    CONSTRUCTOR PUBLIC Lift_root (building AS Building, id AS INTEGER, max_mass AS INTEGER):
        
        iLift_ID = id.
        eLift_door_state = Lift_door_state:uzdarytos.
        eLift_state = Lift_state:laisvas.
        eLift_type = Lift_type:keleivinis.
        iLift_current_pos = 2.
        iLift_floor_top = building:i_building_top_floor.
        iLift_floor_ground = building:i_building_ground_floor.
        iLift_floor_ground_admin = building:i_building_ground_floor_admin.
        iLift_max_mass = max_mass.
        
    END CONSTRUCTOR. 

	METHOD PUBLIC VOID move_lift(INPUT dest AS INTEGER):
		
        IF eLift_state = Lift_state:uzimtas
        THEN DO:
            MESSAGE "Liftas yra uzimtas".
            
        END.
        ELSE DO:
            
            eLift_state = Lift_state:uzimtas.
            eLift_door_state = Lift_door_state:uzdarytos.
            
            DEFINE VARIABLE i AS INTEGER NO-UNDO.
            IF dest > iLift_current_pos
            THEN DO:
                DO WHILE iLift_current_pos <> dest:
                    iLift_current_pos = iLift_current_pos + 1.
                    MESSAGE "Liftas pakilo i " iLift_current_pos "a.".
                END.    
            END.
            ELSE IF dest < iLift_current_pos
            THEN DO:
                DO WHILE iLift_current_pos <> dest:
                    iLift_current_pos = iLift_current_pos - 1.
                    MESSAGE "Liftas nusileido i " iLift_current_pos "a.".
                END.    
            END.
            
            eLift_door_state = Lift_door_state:atidarytos.
            eLift_state = Lift_state:laisvas.
            
        END.    

	END METHOD.

	METHOD PUBLIC VOID move_lift_with_pass(INPUT pass AS I_Passenger, INPUT dest AS INTEGER):
        IF dest > iLift_floor_top
        THEN MESSAGE "Nera tokio auksto. Iveskite mazesni skaiciu".  
        ELSE IF dest < Get_ground_floor(pass:ePass_control_status)
        THEN MESSAGE "Nera tokio auksto. Iveskite didesni skaiciu".
        ELSE IF pass:iPass_mass > iLift_max_mass
        THEN MESSAGE "Liftas nevaziuoja, nes yra perkrautas".
        ELSE DO:
            
            //vaziuojam
            eLift_state = Lift_state:uzimtas.
            eLift_door_state = Lift_door_state:uzdarytos.
            
            DEFINE VARIABLE i AS INTEGER NO-UNDO.
            IF dest > iLift_current_pos
            THEN DO:
                DO WHILE iLift_current_pos <> dest:
                    iLift_current_pos = iLift_current_pos + 1.
                    pass:iPass_current_pos = pass:iPass_current_pos + 1.
                    MESSAGE "Liftas pakilo i " iLift_current_pos "a.".
                END.    
            END.
            ELSE IF dest < iLift_current_pos
            THEN DO:
                DO WHILE iLift_current_pos <> dest:
                    iLift_current_pos = iLift_current_pos - 1.
                    pass:iPass_current_pos = pass:iPass_current_pos - 1.
                    MESSAGE "Liftas nusileido i " iLift_current_pos "a.".
                END.    
            END.
            
            eLift_door_state = Lift_door_state:atidarytos.
            
        END.    

	END METHOD.
	
	METHOD PUBLIC INTEGER Get_ground_floor (pass_control_status AS Passenger_control_status):
	    
	    MESSAGE pass_control_status.
	    IF pass_control_status = Passenger_control_status:administratorius
	    THEN RETURN iLift_floor_ground_admin.
	    ELSE RETURN iLift_floor_ground.
	    
	END METHOD.    
	
	METHOD PUBLIC VOID Print_data ():
	    
        MESSAGE iLift_ID
                eLift_door_state
                eLift_state
                iLift_current_pos
                iLift_max_mass
                eLift_type
                iLift_floor_ground
                iLift_floor_top.
	    
	END METHOD.    
	    

END CLASS.