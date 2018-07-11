 
 /*------------------------------------------------------------------------
    File        : Lift_type
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Wed Jul 11 15:38:04 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

ENUM enum.Lift_type: 
    DEFINE ENUM keleivinis
                krovininis.
END ENUM.