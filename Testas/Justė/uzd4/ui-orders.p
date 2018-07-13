define input parameter cName as character.
define input parameter balance as decimal.

define temp-table ttOrder
    field num as integer
    field OrderDate as date
    field OrderSum as decimal.

define query qOrder for ttOrder.
define browse bOrder query qOrder display num OrderDate OrderSum with 100 down.
define frame fOrder cName label "Kliento vardas" skip
                   balance label "Likutis" with width 60.

enable bOrder with frame fOrder.

run sget-orders(input cName, input-output table ttOrder).
open query qOrder for each ttOrder.


wait-for window-close of current-window.
