
//name variables
define variable name1 as character no-undo format "x(20)".
define variable name2 as character no-undo format "x(20)".

//replacable names arrays
define variable bad-name as character no-undo format "x(20)" extent 2 
    init ["Beatrice", "Stase"].
define variable good-name as character no-undo format "x(20)" extent 2
    init ["Beatričė", "Stasė"].


//counters
define variable count-man as integer no-undo.
define variable count-double-man as integer no-undo.
define variable count-woman as integer no-undo.
define variable count-double-woman as integer no-undo.

//4 diff streams
define stream man.
define stream woman.
define stream report.
define stream repaired.

define variable i as integer no-undo. //variable for loop

//input & output opens
input from "names.txt" .
output stream man to "man.txt".
output stream woman to "woman.txt".
output stream report to "report.txt".
output stream repaired to "repaired.txt".

repeat:
    //reads from file
    name2 = "".
    import delimiter " " name1 name2.
    
    //repairs names and streams to file
    i = 1.
    repeat while i <= extent(bad-name):
        if bad-name[i] = name1 then name1 = good-name[i].
        i = i + 1.
    end.
    
    //separates woman from man names and streams to diff files
    if substring(name1, length(name1)) = "s" 
        then do:
            export stream man name1 name2.
            count-man = count-man + 1.
            if name2 <> ""
                then count-double-man = count-double-man + 1.
        end.
        else do: 
            export stream woman name1 name2.
            count-woman = count-woman + 1.
            if name2 <> ""
                then count-double-woman = count-double-woman + 1.
        end.
    
    export stream repaired name1 name2 .
end.

//streams report data
put stream report unformatted substitute("Man: ~t &1 ~nDouble man: ~t &2 ~n", count-man, count-double-man).
put stream report unformatted substitute("Woman: ~t &1 ~nDouble woman: ~t &2 ~n", count-woman, count-double-woman).

//input & output closes
input close.
output stream man close.
output stream woman close.
output stream report close.
output stream repaired close.