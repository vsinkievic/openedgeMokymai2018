define variable menesiai as character no-undo format "x(35)"
   init "Sausis;Vasaris;Kovas;Balandis;Geguþë;Birþelis;Liepa;Rugpjûtis;Rugsëjis;Spalis;Lapkritis;Gruodis".
define variable dienos as character no-undo format "x(25)"
   init "Pirmadienis;Antradienis;Treèiadienis;Ketvirtadienis;Penktadienis;Ðeðtadienis;Sekmadienis".
define variable metai as integer no-undo format ">>>>".
define variable menuo as integer no-undo.
define variable diena as integer no-undo.
define variable i as integer no-undo.
define variable ivedimoPatikrinimas as logical no-undo.
define variable siandienosData as date init today format "9999-99-99" no-undo.
define variable gimimoData as date format "9999-99-99" no-undo.
define variable isgyventosDienos as integer no-undo.
define variable dienosNumeris as integer no-undo.

define frame fIvedimas 
   metai label "Gimimo metai" skip
   menuo label "Gimimo mënuo" skip
   diena label "Gimimo diena" with 1 col title "Gimimo diena".   
   
display metai menuo diena with frame fIvedimas.

repeat while ivedimoPatikrinimas <> true:
    update metai menuo diena with frame fIvedimas.   
    if (menuo < 1 or menuo > 12) or (diena < 1 or diena > 31)
        then do: message "Blogai ávesti duomenys" view-as alert-box.
        ivedimoPatikrinimas = false.
    end.
    else ivedimoPatikrinimas = true.
end.

gimimoData = date (menuo, diena, metai).
isgyventosDienos = interval(siandienosData, gimimoData, "days").
dienosNumeris = weekday (gimimoData).


    
message metai entry(menuo,menesiai, ";") diena  view-as alert-box.
message isgyventosDienos view-as alert-box.
message entry(dienosNumeris - 1, dienos, ";") view-as alert-box. // -1, nes kaþkodël funkcija gràþina viena diena daugiau negu reikia




    
      
   