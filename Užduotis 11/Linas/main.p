using kelioneLiftu.*.

define variable kelione as class kelioneLiftu no-undo.

kelione = new kelioneLiftu().
kelione:vykdyti().

message substitute("Kelionës pabaigoje keleivis yra &1 aukðte, liftas yra &2 aukðte",
     kelione:pKeleivis:dabAukstas, kelione:pLiftas:dabAukstas).








