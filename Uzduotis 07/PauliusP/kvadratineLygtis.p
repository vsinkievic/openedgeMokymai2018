{skaiciavimai.i}

define variable A as decimal no-undo.
define variable B as decimal no-undo.
define variable C as decimal no-undo.
define variable x1 as decimal no-undo.
define variable x2 as decimal no-undo.
define variable ans as log no-undo.

display ("Iveskite lygti:") SKIP.
update A B C.
ans = solveEquation(A, B, C, x1, x2).
display x1 x2. 
message x1 x2.