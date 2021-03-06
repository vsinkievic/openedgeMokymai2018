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
        message "Liftas gavo kvietim�".
        if currentFloor = personCurrentFloor then do:
            message "Liftas jau yra i�kvietimo auk�te".
        end.
        else do:
            message "Liftas va�iuoja i�" currentFloor "auk�to �" personCurrentFloor "auk�t�".
            currentFloor = personCurrentFloor.
        end.
        message "Durys atsidar�".
    end method.
    
    method public void relocateElevator():
        tempFloorOld = currentFloor.
        message "� kur� auk�t�?".
        update tempFloorNew.
        if (tempFloorNew <= topFloor and tempFloorNew >= 1 and tempFloorNew <> currentFloor) then do:
            currentFloor = tempFloorNew.
            message "Liftas perkeltas i�" tempFloorOld "auk�to �" currentFloor "auk�t�". 
        end.
        else if tempFloorNew = currentFloor then do:
            message "Liftas jau yra �itame auk�te".
        end.
        else do:
            message "N�ra tokio auk�to".
        end.
    end method.
    
    method public integer moveToFloor(desiredFloor as integer):
        if (desiredFloor <= topFloor and desiredFloor >= 1 and desiredFloor <> currentFloor) then do:
            tempFloorOld = currentFloor.
            currentFloor = desiredFloor.
            message "Durys u�sidar�".
            message "Liftas nuve�� keleiv� i�" tempFloorOld "auk�to �" currentFloor "auk�t�". //galima id�ti vard� vietoje "keleiv�" 
            message "Durys atsidar�".
        end.
        else if desiredFloor = currentFloor then do:
            message "Jau esate �itame auk�te".
        end.
        else do:
            message "N�ra tokio auk�to".
        end.
        return currentFloor.
    end method.

END CLASS.