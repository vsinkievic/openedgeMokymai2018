Using liftas.*.
Using keleivis.*.
Using pastatas.*.

block-level on error undo, throw.

define variable as_liftas as class liftas no-undo.
define variable as_keleivis as class keleivis no-undo.
define variable as_pastatas as class pastatas no-undo.
define variable dabartinis_Aukstas as integer.
define variable keleivis_svoris as integer.
define variable norimas_aukstas as integer.


as_keleivis = new keleivis().
as_keleivis:iskvieskLifta().

as_liftas = new liftas().
as_liftas:atvaziuok(as_keleivis:aAukstas).
as_liftas:atidarykDuris().

as_pastatas = new pastatas().

if as_keleivis:aAukstas < as_pastatas:aukstu_kiekis
    then do:
        as_liftas = new liftas().
        as_liftas:uzdarykDuris().
        as_liftas:vaziuok(as_keleivis:ttikslas).
        as_liftas:atidarykDuris().
    end.
          
    else do:
        message "Pastate nëra tiek aukðtø, pasirinkite kità aukðtà!" view-as alert-box.  
    end.

display as_liftas:dabartinis_aukstas.