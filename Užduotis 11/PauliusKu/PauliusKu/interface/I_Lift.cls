 
 /*------------------------------------------------------------------------
    File        : I_Lift
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Wed Jul 11 15:36:14 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING enum.Lift_type FROM PROPATH.
USING enum.Lift_state FROM PROPATH.
USING enum.Lift_door_state FROM PROPATH.
USING enum.Passenger_control_status FROM PROPATH.

BLOCK-LEVEL ON ERROR UNDO, THROW.

INTERFACE interface.I_Lift:
    
    DEFINE PUBLIC PROPERTY iLift_ID AS INTEGER  
    GET.
    SET. 
    
    DEFINE PUBLIC PROPERTY eLift_type AS Lift_type
    GET.
    SET.
    
    DEFINE PUBLIC PROPERTY eLift_state AS Lift_state
    GET.
    SET.
    
    DEFINE PUBLIC PROPERTY eLift_door_state AS Lift_door_state
    GET.
    SET.
    
    DEFINE PUBLIC PROPERTY iLift_current_pos AS INTEGER
    GET.
    SET.
    
    DEFINE PUBLIC PROPERTY iLift_floor_ground AS INTEGER
    GET.
    SET.
    
    DEFINE PUBLIC PROPERTY iLift_floor_ground_admin AS INTEGER
    GET.
    SET.
    
    DEFINE PUBLIC PROPERTY iLift_floor_top AS INTEGER
    GET.
    SET.
    
    DEFINE PUBLIC PROPERTY iLift_max_mass AS INTEGER
    GET.
    SET.
    
    METHOD PUBLIC VOID move_lift(INPUT dest AS INTEGER).
    
    METHOD PUBLIC VOID move_lift_with_pass(pass AS I_Passenger, dest AS INTEGER).
    
    METHOD PUBLIC INTEGER Get_ground_floor (pass_control_status AS Passenger_control_status).
    
    METHOD PUBLIC VOID Print_data ().
    
END INTERFACE.