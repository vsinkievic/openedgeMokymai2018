USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Person: 
    
    define private variable personMass as decimal no-undo.
    define private variable personName as character no-undo init "Keleivis" format "x(50)".
    define private variable personFloorToGo as integer no-undo init ?.
/*    define private variable personId as integer no-undo.*/
    define private variable personCurrentFloor as integer no-undo init 1.
    define private variable isInElevator as logical no-undo init no.
/*    define public static variable numberOfPeople as integer no-undo init 0.*/
        
    constructor Person(mass as decimal):
        personMass = mass.
/*        Person:numberOfPeople = Person:numberOfPeople + 1.*/
/*        personId = Person:numberOfPeople.                 */
    end constructor.
    
    constructor Person(mass as decimal, prsnName as character):
        personMass = mass.
        personName = prsnName.
/*        Person:numberOfPeople = Person:numberOfPeople + 1.*/
/*        personId = Person:numberOfPeople.                 */
    end constructor.
    
    method public void setCurrentFloor(currentFloor as integer):
        personCurrentFloor = currentFloor.
    end method.
    
    method public void setFloorToGo(elvtr as Elevator):
        if isInElevator = yes then do:
            update personFloorToGo.
            personCurrentFloor = elvtr:moveToFloor(personFloorToGo).
        end.
        else do:
            message "Álipkite á liftà".    
        end.
    end method.
    
    method public void callElevator(elvtr as Elevator):
        message personName "iðkvietë liftà".
        elvtr:elevatorIsCalled(personCurrentFloor).
    end method.
    
    method public void enterElevator(elvtr as Elevator):
        if // patikrinti ar liftas tame aukðte kur ir keleivis.
        message personName "álipo á liftà".
        isInElevator = yes.
    end method.
    
    method public void exitElevator():
        message personName "iðlipo ið lifto".
        isInElevator = no.
    end method.
    
/*    method public integer getNr():   */
/*        return Person:numberOfPeople.*/
/*    end method.                      */
/*                                     */
/*     method public integer getId():  */
/*        return personId.             */
/*    end method.                      */

END CLASS.