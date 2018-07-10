USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Person: 
    
    define private variable personMass as decimal no-undo.
    define private variable personFloorToGo as integer no-undo init ?.
    define private variable personCurrentFloor as integer no-undo init 1.
    define variable objElevator1 as Elevator no-undo.
        
    constructor Person(mass as decimal):
        personMass = mass.
    end constructor.
    
    method public void setCurrentFloor(currentFloor as integer):
        personCurrentFloor = currentFloor.
    end method.
    
    method public void setFloorToGo(floorToGo as integer):
        personFloorToGo = floorToGo.
    end method.
    
    method public void callElevator():
        
    end method.

END CLASS.