BLOCK-LEVEL ON ERROR UNDO, THROW.

define button calling label "Kviesti liftà".
define button sendElevator label "Perkelti liftà".

define frame fr calling sendElevator.

define variable objPerson1 as Person no-undo.
define variable objPerson2 as Person no-undo.
define variable objElevator as Elevator no-undo.
define variable objBuilding as Building no-undo.

objBuilding = new Building().
objElevator = new Elevator(objBuilding:getNumberOfFloors()).
objPerson1 = new Person(70).

on choose of calling do:
    objPerson1:callElevator(objElevator).
end.

on choose of sendElevator do:
    objElevator:relocateElevator().
end.

enable calling sendElevator with frame fr.
WAIT-FOR WINDOW-CLOSE OF CURRENT-WINDOW.

/*message objPerson2:getNr().*/