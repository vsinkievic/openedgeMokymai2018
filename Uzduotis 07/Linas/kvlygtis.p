

define variable a as decimal no-undo.
define variable b as decimal no-undo.
define variable c as decimal no-undo.
define variable x1 as decimal no-undo.
define variable x2 as decimal no-undo.

define variable answer as log no-undo.


update a b c help "�veskite tris skai�ius".


{solution.i}

answer = solution(a, b, c, x1, x2).

if not answer then message "Sprendimo n�ra" view-as alert-box.

display x1 x2.

