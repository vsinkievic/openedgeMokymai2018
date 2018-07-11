 
 /*------------------------------------------------------------------------
    File        : I_Passenger
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Wed Jul 11 15:08:04 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING enum.Passenger_control_status FROM PROPATH.
USING interface.I_Lift FROM PROPATH.
USING class.Building FROM PROPATH.

BLOCK-LEVEL ON ERROR UNDO, THROW.

INTERFACE I_Passenger:
    
    DEFINE PUBLIC PROPERTY ePass_control_status AS Passenger_control_status
    GET.
    SET.
    
    DEFINE PUBLIC PROPERTY ePass_state AS Passenger_state
    GET.
    SET.
    
    DEFINE PUBLIC PROPERTY iPass_current_pos AS INTEGER
    GET.
    SET.
    
    DEFINE PUBLIC PROPERTY iPass_mass AS INTEGER
    GET.
    SET.
    
    DEFINE PUBLIC PROPERTY iPass_current_lift_id AS INTEGER
    GET.
    SET.

    METHOD PUBLIC VOID Call_lift (lift AS I_Lift).
    
    METHOD PUBLIC LOGICAL Step_into(lift AS I_Lift).
    
    METHOD PUBLIC LOGICAL Step_out(lift AS I_Lift).
    
    METHOD PUBLIC LOGICAL Order_lift_to_go(lift AS I_Lift, building AS Building, dest AS INTEGER).
        
    METHOD PUBLIC VOID Print_data ().
    
END INTERFACE.