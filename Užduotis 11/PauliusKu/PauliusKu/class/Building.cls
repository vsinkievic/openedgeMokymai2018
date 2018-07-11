 
 /*------------------------------------------------------------------------
    File        : Building
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Wed Jul 11 15:54:33 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING enum.Passenger_control_status FROM PROPATH.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS class.Building: 
    
    DEFINE PUBLIC PROPERTY i_building_top_floor AS INTEGER GET. SET.
    DEFINE PUBLIC PROPERTY i_building_ground_floor AS INTEGER GET. SET.
    DEFINE PUBLIC PROPERTY i_building_ground_floor_admin AS INTEGER GET. SET.
		
	CONSTRUCTOR PUBLIC Building ():
	    i_building_ground_floor_admin = -1.
		i_building_ground_floor = 0.
		i_building_top_floor = 2.		
	END CONSTRUCTOR.  

END CLASS.