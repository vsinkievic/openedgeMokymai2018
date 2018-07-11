USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Elevator: 
    
    define private variable topFloor as integer no-undo.
    define private variable doorOpen as logical no-undo init no.
    define private variable currentFloor as integer no-undo.
    define private variable tempFloorNew as integer no-undo.
    define private variable tempFloorOld as integer no-undo.
       
    constructor Elevator(tpFlr as integer):
        topFloor = tpFlr.
        currentFloor = tpFlr.
    end constructor.
    
    method public void elevatorIsCalled(personCurrentFloor as integer):
        message "Liftas gavo kvietimà".
        if currentFloor = personCurrentFloor then do:
            message "Liftas jau yra iðkvietimo aukðte".
        end.
        else do:
            message "Liftas vaþiuoja ið" currentFloor "aukðto á" personCurrentFloor "aukðtà".
            currentFloor = personCurrentFloor.
        end.
        message "Durys atsidarë".
    end method.
    
    method public void relocateElevator():
        tempFloorOld = currentFloor.
        message "Á kurá aukðtà?".
        update tempFloorNew.
        if (tempFloorNew <= topFloor and tempFloorNew >= 1 and tempFloorNew <> currentFloor) then do:
            currentFloor = tempFloorNew.
            message "Liftas perkeltas ið" tempFloorOld "aukðto á" currentFloor "aukðtà". 
        end.
        else if tempFloorNew = currentFloor then do:
            message "Liftas jau yra ðitame aukðte".
        end.
        else do:
            message "Nëra tokio aukðto".
        end.
    end method.
    
    method public integer moveToFloor(desiredFloor as integer):
        if (desiredFloor <= topFloor and desiredFloor >= 1 and desiredFloor <> currentFloor) then do:
            tempFloorOld = currentFloor.
            currentFloor = desiredFloor.
            message "Durys uþsidarë".
            message "Liftas nuveþë keleivá ið" tempFloorOld "aukðto á" currentFloor "aukðtà". //galima idëti vardà vietoje "keleivá" 
            message "Durys atsidarë".
        end.
        else if desiredFloor = currentFloor then do:
            message "Jau esate ðitame aukðte".
        end.
        else do:
            message "Nëra tokio aukðto".
        end.
        return currentFloor.
    end method.

END CLASS.