using kelioneLiftu.*.

define variable kelione as class kelioneLiftu no-undo.

kelione = new kelioneLiftu().
kelione:vykdyti().

message substitute("Kelion�s pabaigoje keleivis yra &1 auk�te, liftas yra &2 auk�te",
     kelione:pKeleivis:dabAukstas, kelione:pLiftas:dabAukstas).








