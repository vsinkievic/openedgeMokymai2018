using liftas.*.
using pastatas.*.
using keleivis.*.

define variable liftas as class liftas no-undo.
define variable pastatas as class pastatas no-undo.
define variable keleivis as class keleivis no-undo.


pastatas = new pastatas().
liftas = new liftas(pastatas:aukstuSk).
keleivis = new keleivis().


liftas:vaziuoja(keleivis:kviecia(pastatas:aukstuSk), false).
keleivis:ilipa().
liftas:vaziuoja(keleivis:pasirenkaAuksta(pastatas:aukstuSk), true).
keleivis:islipa().
liftas:baigiaDarba().

message keleivis:dabAukstas liftas:dabAukstas.








