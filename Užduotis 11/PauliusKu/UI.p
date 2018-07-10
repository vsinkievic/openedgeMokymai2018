
/*------------------------------------------------------------------------
    File        : UI.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Jul 10 15:56:00 EEST 2018
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.
DEFINE VARIABLE building AS CLASS Building NO-UNDO.
DEFINE VARIABLE lift AS CLASS Lift NO-UNDO.
DEFINE VARIABLE passenger AS CLASS Passenger NO-UNDO.
DEFINE BUTTON kviesti LABEL "Kviesti lifta".
DEFINE BUTTON pasirinkti_a LABEL "Pasirinkti auksta".
DEFINE BUTTON ilipti LABEL "Ilipti i lifta".
DEFINE BUTTON islipti LABEL "Islipti is lifto".
DEFINE BUTTON laiptine1 LABEL "Nusileisti laiptine i 1 a.".
DEFINE BUTTON laiptine10 LABEL "Pakilti laiptine i 10 a.".
DEFINE BUTTON lift_data LABEL "Lifto duomenys".
DEFINE BUTTON passenger_data LABEL "Keleivio duomenys".

DEFINE VARIABLE destination AS INTEGER NO-UNDO.

FORM kviesti ilipti islipti pasirinkti_a laiptine1 laiptine10 lift_data passenger_data WITH FRAME but-frame ROW 1.

/* ***************************   Triggers   *************************** */

ON CHOOSE OF kviesti DO:
    passenger:Call_lift(lift).
END.

ON CHOOSE OF ilipti DO:
    passenger:Step_into(lift).
END.

ON CHOOSE OF islipti DO:
    passenger:Step_out(lift).
END.

ON CHOOSE OF pasirinkti_a DO:
    ivestis:
    REPEAT:
       SET destination. 
       IF passenger:Go_to_destination(lift, building:Get_floors(), destination)
       THEN DO:
           MESSAGE "Pastate nera tokio auksto".
           LEAVE ivestis.
       END.
    END.   
   
END.

ON CHOOSE OF laiptine1 DO:
    passenger:Go_to_first().
END.

ON CHOOSE OF laiptine10 DO:
    passenger:Go_to_top().
END.


ON CHOOSE OF lift_data DO:
    lift:Print_lift_data().
END.

ON CHOOSE OF passenger_data DO:
    passenger:Print_passenger_data().
END.

/* ***************************  Main Block  *************************** */

building = NEW Building().
lift = NEW Lift().
passenger = NEW Passenger().

ENABLE kviesti ilipti islipti pasirinkti_a laiptine1 laiptine10 lift_data passenger_data WITH FRAME but-frame.
WAIT-FOR WINDOW-CLOSE OF CURRENT-WINDOW.
