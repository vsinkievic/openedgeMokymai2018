


define variable i as integer init 226789123 format ">>>>>>>>>>>>>9"
        view-as combo-box list-item-pairs "Pirmas","1","Antras", "2".
define variable i64 as int64 init 223456789123 format ">>>>>>>>>>>>>9".
define variable cError as character no-undo 
    init 'nera nieko sudetingo' format "x(40)"
    label "Klaida"
    view-as editor size 20 by 5.
define variable data as date no-undo init 06/27/2018 format "9999-99-99".

define variable menesiai as character no-undo extent .

define variable suma as decimal no-undo 
      /* decimals 2*/ /*init 1001001001.604*/ format ">>>,>>>,>>>,>>>,>>9.<<<<<<<<".
suma = 1001001001.6012000.
message "i" i.
message "i64" i64.
message "cError" cError.
message "suma" suma.
display i i64 cError format "!(10)"
        data label "Siandiena"
        suma
        with 1 col  title "Bandymas"
        with frame f-dlg centered .
message i view-as alert-box.

