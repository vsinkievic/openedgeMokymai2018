BLOCK-LEVEL ON ERROR UNDO, THROW.

define button calling label "Kviesti lift�".
define button sendElevator label "Perkelti lift�".
define button entering label "�lipti � lift�".
define button exiting label "I�lipti i� lifto".
define button choosingFloor label "Auk�tas, � kur� norite va�iuoti".

define frame fr calling entering choosingFloor exiting sendElevator.

define variable objPerson1 as Person no-undo.
define variable objPerson2 as Person no-undo.
define variable objElevator as Elevator no-undo.
define variable objBuilding as Building no-undo.

objBuilding = new Building().
objElevator = new Elevator(objBuilding:getNumberOfFloors()).
objPerson1 = new Person(70).
objPerson2 = new Person(90, "Petras").

on choose of calling do:
    objPerson2:callElevator(objElevator).
end.

on choose of sendElevator do:
    objElevator:relocateElevator().
end.

on choose of entering do:
    objPerson2:enterElevator(objElevator).
end.

on choose of choosingFloor do:
    objPerson2:setFloorToGo(objElevator).
end.

on choose of exiting do:
    objPerson2:exitElevator().
end.

/*message objPerson1:getNr().*/
/*message objPerson2:getId().*/
/*message objPerson1:getId().*/

enable all with frame fr.
WAIT-FOR WINDOW-CLOSE OF CURRENT-WINDOW.