define variable c as character init "vardas=Jonas;pavarde=Jonaitis;amzius=27".


define variable i as integer no-undo.
define variable j as integer no-undo.
define variable key-value as character no-undo.

repeat i = 1 to num-entries(c, ";"):
    key-value = entry(i, c, ";").
    
    display entry(1, key-value, "=") format "x(15)" label "KEY"
            entry(2, key-value, "=") format "x(30)" label "VALUE".
end.