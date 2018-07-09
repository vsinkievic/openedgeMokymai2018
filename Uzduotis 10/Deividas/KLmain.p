using KvLygtis.*.

def var a as dec no-undo.
def var b as dec no-undo.
def var c as dec no-undo.


define variable kvadratine as class KvLygtis no-undo.

update a b c.


kvadratine = NEW KvLygtis(a, b, c).

if kvadratine:yraSprendinys
    then do:
        if kvadratine:X2 = ?
            then do:
                 display skip(1) kvadratine:X1.
                 message "Diskriminantas yra 0 tai yra tik vienas sprendinys" view-as alert-box.
            end.
        else do:
            display skip(1) kvadratine:X1  kvadratine:X2.
            message "Lygtis turi du sprendinius" view-as alert-box.
        end.
    end.
else message "Lygtis neturi sprendiniø ,nes Diskriminantas maþiau uþ 0" view-as alert-box.