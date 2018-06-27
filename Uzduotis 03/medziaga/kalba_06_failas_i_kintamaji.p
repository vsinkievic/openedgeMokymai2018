

define variable turinys as longchar no-undo.


copy-lob file "Adresai.csv" to turinys.

copy-lob turinys to file "adresu_kopija.csv".

message string(turinys) view-as alert-box.