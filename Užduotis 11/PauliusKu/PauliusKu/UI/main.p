
/*------------------------------------------------------------------------
    File        : main.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed Jul 11 16:59:10 EEST 2018
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING interface.I_Lift FROM PROPATH.
USING class.Building FROM PROPATH.
USING class.Lift_root FROM PROPATH.
USING class.Passenger_root FROM PROPATH.
USING class.Passenger_admin FROM PROPATH.

/* ********************  Preprocessor Definitions  ******************** */
DEFINE VARIABLE building AS CLASS Building.
DEFINE VARIABLE passenger AS CLASS I_Passenger.
DEFINE VARIABLE passenger2 AS CLASS I_Passenger.
DEFINE VARIABLE passenger3 AS CLASS I_Passenger.
DEFINE VARIABLE lift AS CLASS I_Lift.
DEFINE VARIABLE lift2 AS CLASS I_Lift.

DEFINE BUTTON kviesti1.
DEFINE BUTTON kviesti2.
DEFINE BUTTON ilipti.
DEFINE BUTTON nueiti.
DEFINE BUTTON pasirinkti_auksta.
DEFINE BUTTON islipti.
DEFINE BUTTON a-1.
DEFINE BUTTON a0.
DEFINE BUTTON a1.
DEFINE BUTTON a2.

DEFINE BUTTON kviesti12.
DEFINE BUTTON kviesti22.
DEFINE BUTTON ilipti2.
DEFINE BUTTON nueiti2.
DEFINE BUTTON pasirinkti_auksta2.
DEFINE BUTTON islipti2.
DEFINE BUTTON a-12.
DEFINE BUTTON a02.
DEFINE BUTTON a12.
DEFINE BUTTON a22.

DEFINE BUTTON kviesti13.
DEFINE BUTTON kviesti23.
DEFINE BUTTON ilipti3.
DEFINE BUTTON nueiti3.
DEFINE BUTTON pasirinkti_auksta3.
DEFINE BUTTON islipti3.
DEFINE BUTTON a-13.
DEFINE BUTTON a03.
DEFINE BUTTON a13.
DEFINE BUTTON a23.

DEFINE BUTTON keleivio_duomenys1.
DEFINE BUTTON keleivio_duomenys2.
DEFINE BUTTON keleivio_duomenys3.
DEFINE BUTTON lifto_duomenys1 LABEL "1 lifto duomenys".
DEFINE BUTTON lifto_duomenys2 LABEL "2 lifto duomenys".


FORM kviesti1 kviesti2 WITH FRAME pastate ROW 1 COLUMN 1.
FORM ilipti nueiti WITH FRAME laukia ROW 3 COLUMN 1.
FORM pasirinkti_auksta islipti WITH FRAME lifte ROW 5 COLUMN 1.
FORM a-1 a0 a1 a2 WITH FRAME aukstai ROW 7 COLUMN 1.

FORM kviesti12 kviesti22 WITH FRAME pastate2 ROW 1 COLUMN 10.
FORM ilipti2 nueiti2 WITH FRAME laukia2 ROW 3 COLUMN 10.
FORM pasirinkti_auksta2 islipti2 WITH FRAME lifte2 ROW 5 COLUMN 10.
FORM a-12 a02 a12 a22 WITH FRAME aukstai2 ROW 7 COLUMN 10.

FORM kviesti13 kviesti23 WITH FRAME pastate3 ROW 1 COLUMN 1.
FORM ilipti3 nueiti3 WITH FRAME laukia3 ROW 3 COLUMN 1.
FORM pasirinkti_auksta3 islipti3 WITH FRAME lifte3 ROW 5 COLUMN 1.
FORM a-13 a03 a13 a23 WITH FRAME aukstai3 ROW 7 COLUMN 1.

FORM keleivio_duomenys1 keleivio_duomenys2 keleivio_duomenys3 WITH FRAME keleivio ROW 13 COLUMN 1.
FORM lifto_duomenys1 lifto_duomenys2 WITH FRAME lifto ROW 15 COLUMN 1.


//---------------------------------------------------------------------------
ON CHOOSE OF kviesti1 DO:
    passenger:Call_lift(lift).
    DISABLE kviesti1 kviesti2 WITH FRAME pastate ROW 1 COLUMN 1.
    ENABLE ilipti nueiti WITH FRAME laukia ROW 3 COLUMN 1.
END.

/*ON CHOOSE OF kviesti2 DO:                                       */
/*    passenger:Call_lift(lift).                                  */
/*    DISABLE kviesti1 kviesti2 WITH FRAME pastate ROW 1 COLUMN 1.*/
/*    ENABLE ilipti nueiti WITH FRAME laukia ROW 3 COLUMN 1.      */
/*END.                                                            */

ON CHOOSE OF ilipti DO:
    
    IF passenger:Step_into(lift)
    THEN DO:
        DISABLE ilipti nueiti WITH FRAME laukia ROW 3 COLUMN 1.
        ENABLE pasirinkti_auksta islipti WITH FRAME lifte ROW 5 COLUMN 1.
    END.    
END.

ON CHOOSE OF nueiti DO:
    ENABLE kviesti1 kviesti2 WITH FRAME pastate ROW 10 COLUMN 1.
    DISABLE ilipti nueiti WITH FRAME laukia ROW 3 COLUMN 1.
END.

ON CHOOSE OF pasirinkti_auksta DO:
    ENABLE a-1 a0 a1 a2 WITH FRAME aukstai ROW 7 COLUMN 1.
    DISABLE pasirinkti_auksta islipti WITH FRAME lifte ROW 5 COLUMN 1.


END.

ON CHOOSE OF islipti DO:
    IF passenger:Step_out(lift)
    THEN DO:
        DISABLE pasirinkti_auksta islipti WITH FRAME lifte ROW 5 COLUMN 1.
        ENABLE ilipti nueiti WITH FRAME laukia ROW 3 COLUMN 1.
    END.  
END.

ON CHOOSE OF a-1 DO:
    DISABLE a-1 a0 a1 a2 WITH FRAME aukstai ROW 7 COLUMN 1.
    ENABLE pasirinkti_auksta islipti WITH FRAME lifte ROW 5 COLUMN 1.
    passenger:Order_lift_to_go(lift, building, -1).
END.

ON CHOOSE OF a0 DO:
    DISABLE a-1 a0 a1 a2 WITH FRAME aukstai ROW 7 COLUMN 1.
    ENABLE pasirinkti_auksta islipti WITH FRAME lifte ROW 5 COLUMN 1.
    passenger:Order_lift_to_go(lift, building, 0).
END. 

ON CHOOSE OF a1 DO:
    DISABLE a-1 a0 a1 a2 WITH FRAME aukstai ROW 7 COLUMN 1.
    ENABLE pasirinkti_auksta islipti WITH FRAME lifte ROW 5 COLUMN 1.
    passenger:Order_lift_to_go(lift, building, 1).
END. 

ON CHOOSE OF a2 DO:
    DISABLE a-1 a0 a1 a2 WITH FRAME aukstai ROW 7 COLUMN 1.
    ENABLE pasirinkti_auksta islipti WITH FRAME lifte ROW 5 COLUMN 1.
    passenger:Order_lift_to_go(lift, building, 2).
END. 

//-----------------------------------------------------------------------------

ON CHOOSE OF kviesti12 DO:
    passenger2:Call_lift(lift).
    DISABLE kviesti12 kviesti22 WITH FRAME pastate2 ROW 1 COLUMN 30.
    ENABLE ilipti2 nueiti2 WITH FRAME laukia2 ROW 3 COLUMN 30.
END.

/*ON CHOOSE OF kviesti22 DO:                                       */
/*    passenger2:Call_lift(lift).                                  */
/*    DISABLE kviesti12 kviesti22 WITH FRAME pastate2 ROW 1 COLUMN 30.*/
/*    ENABLE ilipti2 nueiti2 WITH FRAME laukia2 ROW 3 COLUMN 30.      */
/*END.                                                            */

ON CHOOSE OF ilipti2 DO:
    
    IF passenger2:Step_into(lift)
    THEN DO:
        DISABLE ilipti2 nueiti2 WITH FRAME laukia2 ROW 3 COLUMN 30.
        ENABLE pasirinkti_auksta2 islipti2 WITH FRAME lifte2 ROW 5 COLUMN 30.
    END.    
END.

ON CHOOSE OF nueiti2 DO:
    ENABLE kviesti12 kviesti22 WITH FRAME pastate2 ROW 10 COLUMN 30.
    DISABLE ilipti2 nueiti2 WITH FRAME laukia2 ROW 3 COLUMN 30.
END.

ON CHOOSE OF pasirinkti_auksta2 DO:
    ENABLE a-12 a02 a12 a22 WITH FRAME aukstai2 ROW 7 COLUMN 30.
    DISABLE pasirinkti_auksta2 islipti2 WITH FRAME lifte2 ROW 5 COLUMN 30.


END.

ON CHOOSE OF islipti2 DO:
    IF passenger2:Step_out(lift)
    THEN DO:
        DISABLE pasirinkti_auksta2 islipti2 WITH FRAME lifte2 ROW 5 COLUMN 30.
        ENABLE ilipti2 nueiti2 WITH FRAME laukia2 ROW 3 COLUMN 30.
    END.  
END.

ON CHOOSE OF a-12 DO:
    DISABLE a-12 a0 a12 a22 WITH FRAME aukstai2 ROW 7 COLUMN 30.
    ENABLE pasirinkti_auksta2 islipti2 WITH FRAME lifte2 ROW 5 COLUMN 30.
    passenger2:Order_lift_to_go(lift, building, -1).
END.

ON CHOOSE OF a02 DO:
    DISABLE a-12 a02 a12 a22 WITH FRAME aukstai2 ROW 7 COLUMN 30.
    ENABLE pasirinkti_auksta2 islipti2 WITH FRAME lifte2 ROW 5 COLUMN 30.
    passenger2:Order_lift_to_go(lift, building, 0).
END. 

ON CHOOSE OF a12 DO:
    DISABLE a-12 a02 a12 a22 WITH FRAME aukstai2 ROW 7 COLUMN 30.
    ENABLE pasirinkti_auksta2 islipti2 WITH FRAME lifte2 ROW 5 COLUMN 30.
    passenger2:Order_lift_to_go(lift, building, 1).
END. 

ON CHOOSE OF a22 DO:
    DISABLE a-12 a02 a12 a22 WITH FRAME aukstai2 ROW 7 COLUMN 30.
    ENABLE pasirinkti_auksta2 islipti2 WITH FRAME lifte2 ROW 5 COLUMN 30.
    passenger2:Order_lift_to_go(lift, building, 2).
END. 

//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
ON CHOOSE OF keleivio_duomenys1 DO:
    passenger:Print_data().
END. 

ON CHOOSE OF keleivio_duomenys2 DO:
    passenger2:Print_data().
END. 

ON CHOOSE OF lifto_duomenys1 DO:
    lift:Print_data().
END.     
     

/* ***************************  Main Block  *************************** */

building = NEW Building().
passenger = NEW Passenger_admin(80).
passenger2 = NEW Passenger_root(70).
lift = NEW Lift_root(building, 1, 500).

ENABLE kviesti1 kviesti2 WITH FRAME pastate ROW 1 COLUMN 1.
ENABLE kviesti12 kviesti22 WITH FRAME pastate2 ROW 1 COLUMN 30.
ENABLE kviesti13 kviesti23 WITH FRAME pastate3 ROW 1 COLUMN 60.


ENABLE keleivio_duomenys1 keleivio_duomenys2 keleivio_duomenys3 WITH FRAME keleivio ROW 13 COLUMN 10.
ENABLE lifto_duomenys1 lifto_duomenys2 WITH FRAME lifto ROW 15 COLUMN 21.
//passenger:Print_data().
//lift:Print_data().
WAIT-FOR WINDOW-CLOSE OF CURRENT-WINDOW.