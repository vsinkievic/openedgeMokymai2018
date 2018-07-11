 
 /*------------------------------------------------------------------------
    File        : Passenger_state
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Wed Jul 11 15:17:08 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

ENUM Passenger_state: 
    DEFINE ENUM pastate
                laukia
                lifte.
END ENUM.