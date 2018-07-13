define variable metai as integer no-undo.
define variable menesis as integer no-undo.
define variable diena as integer no-undo.
define variable GimimoDiena as date no-undo.
define variable PragyventosDienos as integer no-undo.
define variable SiandienosDiena as date init today no-undo.

define variable menesiai as character no-undo format "x(25)" 
  init "Sausis;Vasaris;Kovas;Balandis;Gegu��;Bir�elis;Liepa;Rugpj�tis;Rugs�jis;Spalis;Lapkritis;Gruodis".
define variable dienos as character no-undo format "x(25)" 
  init "Pirmadienis;Antradienis;Tre�iadienis;Ketvirtadienis;Penktadienis;�e�tadienis;Sekmadienis".
  
      


display metai menesis diena.

update metai label "Gimimo metai" format ">>>>"
    menesis label "M�nesis" format ">>"
    diena label "Diena" format ">>".
    

if metai > 0 and metai < 2018
    then do:
    if menesis > 0 and menesis < 12
        then do:
            if diena > 0 and diena < 31
                then do:
                    GimimoDiena = date(menesis,diena,metai).
                    PragyventosDienos = interval(SiandienosDiena,GimimoDiena,"days").
                    message metai entry(menesis, menesiai, ";") diena skip(1)
                    "Pragyventu dien� skai�ius: "PragyventosDienos skip(1)
                    "Gimimo diena buvo:" entry(weekday(GimimoDiena - 1), dienos, ";")           //Testuojant pamatyta kad gra�ina viena diena per daug
                    view-as alert-box.
            end.
            else message "Diena neatinka relyb�s" view-as alert-box.
        end.
        else message "Menesis neatinka relyb�s" view-as alert-box.
    end.
    else message "Metai neatinka relyb�s" view-as alert-box.
    
    
    
    
    