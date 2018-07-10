
define variable elevator as class liftas no-undo.
define variable building as class pastatas no-undo.
define variable passenger as class keleivis no-undo.


building = new pastatas().
elevator = new liftas(building:aukstuSkaicius).
passenger = new keleivis(building:aukstuSkaicius, building:keliamojiJega).

elevator:atvaziuok(passenger:iskvieskLifta(),passenger:busena).
passenger:Lifte().
elevator:atvaziuok(passenger:Paukstas,passenger:busena).
passenger:Lifte().