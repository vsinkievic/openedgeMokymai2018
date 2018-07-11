USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Building: 
    
    define private variable numberOfFloors as integer no-undo init 5.
    
    method public integer getNumberOfFloors():
        return numberOfFloors.
    end method.

END CLASS.