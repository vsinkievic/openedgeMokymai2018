USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Person: 
    
    define private variable personMass as decimal no-undo.
    define private variable personFloorToGo as integer no-undo init ?.
    define private variable personId as integer no-undo.
    define private variable personCurrentFloor as integer no-undo init 1.
    define private variable isInElevator as logical no-undo init no.
    define public static variable numberOfPeople as integer no-undo init 0.
        
    constructor Person(mass as decimal):
        personMass = mass.
        Person:numberOfPeople = Person:numberOfPeople + 1.
        personId = Person:numberOfPeople.
    end constructor.
    
    method public void setCurrentFloor(currentFloor as integer):
        personCurrentFloor = currentFloor.
    end method.
    
    method public void setFloorToGo(floorToGo as integer):
        personFloorToGo = floorToGo.
    end method.
    
    method public void callElevator(elvtr as Elevator):
        message "Keleivis nr. " personId " iðkvietë liftà".
        elvtr:elevatorIsCalled(personCurrentFloor).
    end method.
    
/*    method public integer getNr():   */
/*        return Person:numberOfPeople.*/
/*    end method.                      */

END CLASS.