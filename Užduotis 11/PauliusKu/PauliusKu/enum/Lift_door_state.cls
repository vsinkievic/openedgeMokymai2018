 
 /*------------------------------------------------------------------------
    File        : Lift_door_state
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Wed Jul 11 15:41:37 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

ENUM enum.Lift_door_state: 
    DEFINE ENUM atidarytos
                uzdarytos.
END ENUM.