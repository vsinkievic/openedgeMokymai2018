using src.kvLygtis from propath.
using src.kvLygtis2 from propath.

define variable a as decimal no-undo.
define variable b as decimal no-undo.
define variable c as decimal no-undo.

define variable lygtiesSprendejas as class kvLygtis no-undo.
define variable lygtiesSprendejas2 as class kvLygtis2 no-undo.

/*    Budas su konstruktorium                                    */
/*define frame kintIvedimas                                      */
/*     a b c                                                     */
/*     with side-labels 1 col with title "Áveskite kintamuosius".*/
/*                                                               */
/*display a b c with frame kintIvedimas.                         */
/*update a b c with frame kintIvedimas.                          */
/*                                                               */
/*lygtiesSprendejas = new kvLygtis(a, b, c).                     */
/*if lygtiesSprendejas:yraSprendiniai()                          */
/*then display                                                   */
/*        lygtiesSprendejas:x1                                   */
/*        lygtiesSprendejas:x2.                                  */
/*else message "Lygtis neturi sprendiniu" view-as alert-box.     */

define frame kintIvedimas
     a b c
     with side-labels 1 col with title "Áveskite kintamuosius".

     
display a b c with frame kintIvedimas.
update a b c with frame kintIvedimas.

lygtiesSprendejas2 = new kvLygtis2().
if lygtiesSprendejas2:yraSprendiniai(a,b,c)
then display
        lygtiesSprendejas2:x1
        lygtiesSprendejas2:x2.
else message "Lygtis neturi sprendiniu" view-as alert-box.