 
 /*------------------------------------------------------------------------
    File        : Passenger_control_status
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Wed Jul 11 15:29:07 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

ENUM enum.Passenger_control_status: 
    DEFINE ENUM svecias
            darbuotojas
            administratorius.
END ENUM.