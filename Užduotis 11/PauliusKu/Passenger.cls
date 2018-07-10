 
 /*------------------------------------------------------------------------
    File        : passenger
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Tue Jul 10 16:08:03 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Passenger: 

    DEFINE VARIABLE ipass_state AS CHARACTER NO-UNDO.
    DEFINE VARIABLE ipass_dest AS INTEGER NO-UNDO.
    DEFINE VARIABLE ipass_current_pos AS INTEGER NO-UNDO.
      
	CONSTRUCTOR PUBLIC passenger (  ):
		ipass_state = "Pastate".
		ipass_dest = ?.
		ipass_current_pos = 5.
		
	END CONSTRUCTOR.

    METHOD PUBLIC VOID Call_lift (lift AS Lift):
        IF ipass_state = "Lifte"
        THEN DO:
            MESSAGE "Lifte negalima iskviesti lifto".
            
        END.
        
        ELSE DO:
            lift:may_move_to_passenger(ipass_current_pos).
            ipass_state = "Liftas yra kvieciamas".
            MESSAGE ipass_state.
        END.
        
    END METHOD.
    
    METHOD PUBLIC VOID Step_into(lift AS Lift):
        
        IF ipass_state = "Lifte"
        THEN DO:
            MESSAGE "As jau lifte".
        END.
        ELSE DO:
            
            IF ipass_current_pos = lift:Get_lift_current_pos() AND 
               lift:Get_lift_door_state() = "Atidarytos"
            THEN DO:
                ipass_state = "Lifte".
                lift:Set_clift_state_to_uzimtas().
                MESSAGE "Ilipau i lifta".
                
            END.
            ELSE DO:
                MESSAGE "lifto nera arba durys yra uzdarytos".
            END.   
         
        END.        
        
    END METHOD.
    
    METHOD PUBLIC VOID Step_out(lift AS Lift):

        IF ipass_state = "Lifte"
        THEN DO:
            IF lift:Get_lift_door_state() = "Atidarytos"
            THEN DO:
                ipass_state = "Pastate".
                lift:Set_clift_state_to_laisvas().
                MESSAGE "Islipau is lifto".
            END.
            ELSE DO:
                MESSAGE "Lifto durys uzdarytos".
            END.        
        END.
        ELSE DO:
            MESSAGE "As ne lifte".
        END.    
        
    END METHOD.
    
    METHOD PUBLIC LOG Go_to_destination(lift AS Lift, floors AS INTEGER, dest AS INTEGER):
        
        IF dest <= floors AND dest >= 1
        THEN DO:
            IF ipass_state = "Lifte"
            THEN DO:
                
                lift:Moving_lift(dest, THIS-OBJECT).
            END.
            ELSE DO:
                MESSAGE "nesu lifte".
            END.
            RETURN FALSE.  
            
        END.
        ELSE RETURN TRUE.        
        
    END METHOD.    
    
    METHOD PUBLIC INTEGER Get_ipass_current_pos ():
        RETURN ipass_current_pos.
    END METHOD.
    
    METHOD PUBLIC VOID Move_up_or_down(dirrection AS LOG): //0 zemyn, 1 aukstyn
        IF dirrection THEN ipass_current_pos = ipass_current_pos + 1.
        ELSE ipass_current_pos = ipass_current_pos - 1.
        
    END METHOD.
    
    METHOD PUBLIC VOID Go_to_first():
        IF ipass_state <> "Lifte"
        THEN DO:
            ipass_current_pos = 1.
            ipass_state = "Pastate".
            MESSAGE "Nulipau i 1 auksta".
            
        END.
        ELSE MESSAGE "Negalima nusileisti, nes as lifte".       
    END METHOD.    

    METHOD PUBLIC VOID Go_to_top():
        IF ipass_state <> "Lifte"
        THEN DO:
            ipass_current_pos = 10.
            ipass_state = "Pastate".
            MESSAGE "Uzlipau i 10 auksta".
            
        END.
        ELSE MESSAGE "Negalima pakilti, nes as lifte".       
    END METHOD.   

    METHOD PUBLIC VOID Print_passenger_data ():
    
        MESSAGE ipass_state
                ipass_dest
                ipass_current_pos.
    END METHOD.

END CLASS.