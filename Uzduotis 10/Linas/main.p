
using kLygtis.*.

define variable a as decimal no-undo.
define variable b as decimal no-undo.
define variable c as decimal no-undo.

define variable kvadratine1 as class kLygtis no-undo.



update a b c help "Áveskite tris skaièius".


kvadratine1 = new kLygtis(a, b, c).

if kvadratine1:sprestina() then do:
    display kvadratine1:x1 kvadratine1:x2.
    end.
else do:
    display "Sprendimas negalimas".
end.

