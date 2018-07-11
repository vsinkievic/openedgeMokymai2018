 
 /*------------------------------------------------------------------------
    File        : pastatas
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Tue Jul 10 16:55:33 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.

block-level on error undo, throw.

class uzduotis11.pastatas: 
    
    define public property aukstuSkaicius as integer no-undo get. set.
    
    constructor public pastatas():
        assign
        aukstuSkaicius = random(1,100).
    end constructor.    

end class.