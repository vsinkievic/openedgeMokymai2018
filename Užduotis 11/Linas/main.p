using liftas.*.
using pastatas.*.
using keleivis.*.

define variable liftas as class liftas no-undo.
define variable krovLiftas as class kLiftas no-undo.
define variable pastatas as class pastatas no-undo.
define variable keleivis1 as class IKeleivis no-undo.
define variable keleivis2 as class IKeleivis no-undo.

define variable iAukstas1 as integer no-undo.
define variable iAukstas2 as integer no-undo.
define variable cVardas as character no-undo.
define variable artimesnisLiftas as class liftas no-undo.

output to 'ataskaita.txt'.

pastatas = new pastatas().
liftas = new liftas(pastatas:aukstuSk).
krovLiftas = new kLiftas(pastatas:aukstuSk).


/* --------------- vienas liftas --------------*/

/*keleivis1 = new KeleivisV("Jeronimas").                       */
/*keleivis1:kviecia(liftas).                                    */
/*liftas:vaziuoja(keleivis1:dabAukstas, liftoBusena:beKeleivio).*/
/*keleivis1:ilipa().                                            */
/*keleivis1:pasirenkaAuksta(liftas:aukstuSk).                   */
/*liftas:vaziuoja(keleivis1).                                   */
/*keleivis1:islipa().                                           */
/*liftas:baigiaDarba().                                         */
/*pause.                                                        */
/*keleivis2 = new KeleivisV("Veronika").                        */
/*keleivis2:kviecia(liftas).                                    */
/*liftas:vaziuoja(keleivis2:dabAukstas, liftoBusena:beKeleivio).*/
/*keleivis2:ilipa().                                            */
/*keleivis2:pasirenkaAuksta(liftas:aukstuSk).                   */
/*liftas:vaziuoja(keleivis1).                                   */
/*keleivis2:islipa().                                           */
/*liftas:baigiaDarba().                                         */
/*pause.                                                        */


/* ---------------- du liftai ---------------- */

liftas:liftoStatusas().
krovLiftas:liftoStatusas().
keleivis1 = new KeleivisV("Jeronimas").
keleivis1:kviecia(liftas, krovLiftas).

if liftas:laukimoTrukme(liftas:dabAukstas, keleivis1:dabAukstas) >= 
   krovLiftas:laukimoTrukme (krovLiftas:dabAukstas, keleivis1:dabAukstas) 
then artimesnisLiftas = krovLiftas.
else artimesnisLiftas = liftas.

artimesnisLiftas:vaziuoja(keleivis1:dabAukstas, liftoBusena:beKeleivio).
keleivis1:ilipa().
keleivis1:pasirenkaAuksta(artimesnisLiftas:aukstuSk).
artimesnisLiftas:vaziuoja(keleivis1).
keleivis1:islipa().
artimesnisLiftas:baigiaDarba().









