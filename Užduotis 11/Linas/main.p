using liftas.*.
using pastatas.*.
using keleivis.*.

define variable liftas as class liftas no-undo.
define variable iLiftas1 as class ismanusLiftas no-undo.
define variable iLiftas2 as class ismanusLiftas no-undo.

define variable pastatas as class pastatas no-undo.
define variable keleivis as class IKeleivis no-undo.
define variable keleivis1 as class IKeleivis no-undo.
define variable keleivis2 as class IKeleivis no-undo.

define variable artimesnisLiftas as class ismanusLiftas no-undo.

output to 'ataskaita.txt'.

pastatas = new pastatas().



put unformatted skip "------------- Vienas liftas ----------------" skip.


liftas = new liftas(pastatas:aukstuSk, 100, 3).
liftas:liftoStatusas().

// pirmas keleivis
keleivis1 = new KeleivisV("Jeronimas").

keleivis1:kviecia(liftas).
liftas:vaziuoja(keleivis1:dabAukstas, liftoBusena:beKeleivio).
keleivis1:ilipa().
keleivis1:pasirenkaAuksta(liftas:aukstuSk).
liftas:vaziuoja(keleivis1).
keleivis1:islipa().
liftas:baigiaDarba().


// antras keleivis
keleivis2 = new KeleivisV("Veronika").

keleivis2:kviecia(liftas).
liftas:vaziuoja(keleivis2:dabAukstas, liftoBusena:beKeleivio).
keleivis2:ilipa().
keleivis2:pasirenkaAuksta(liftas:aukstuSk).
liftas:vaziuoja(keleivis2).
keleivis2:islipa().
liftas:baigiaDarba().





put unformatted skip "------------- Du liftai ----------------" skip.


iLiftas1 = new ismanusLiftas(pastatas:aukstuSk, 200, 3).
iLiftas1:liftoStatusas().
iLiftas2 = new ismanusLiftas(pastatas:aukstuSk, 300, 5).
iLiftas2:liftoStatusas().


// pirmas keleivis
keleivis = new KeleivisV("Jeronimas").
keleivis:kviecia(iLiftas1, iLiftas2).

artimesnisLiftas = iLiftas1:artimesnis(iLiftas1, iLiftas2, keleivis:dabAukstas).

artimesnisLiftas:vaziuoja(keleivis:dabAukstas, liftoBusena:beKeleivio).
keleivis:ilipa().
keleivis:pasirenkaAuksta(artimesnisLiftas:aukstuSk).
artimesnisLiftas:vaziuoja(keleivis).
keleivis:islipa().
artimesnisLiftas:baigiaDarba().


//antras keleivis
keleivis = new KeleivisV("Veronika").
keleivis:kviecia(iLiftas1, iLiftas2).

artimesnisLiftas = iLiftas1:artimesnis(iLiftas1, iLiftas2, keleivis:dabAukstas).

artimesnisLiftas:vaziuoja(keleivis:dabAukstas, liftoBusena:beKeleivio).
keleivis:ilipa().
keleivis:pasirenkaAuksta(artimesnisLiftas:aukstuSk).
artimesnisLiftas:vaziuoja(keleivis).
keleivis:islipa().
artimesnisLiftas:baigiaDarba().






