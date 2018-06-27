
define variable menesiai as character no-undo format "x(25)" extent 12
    init ["Sausis", "Vasaris", "Kovas", "Balandis", "Geguþë", 
          "Birþelis", "Liepa", "Rugpjûtis", "Rugsëjis", "Spalis",
          "Lapkritis", "Gruodis"].

define variable i as integer no-undo.
          
output to "menesiai.txt".
repeat i = 1 to extent(menesiai): 
    display i (minimum maximum average total)  
    menesiai[i] with stream-io.
end.
output close.

output to "menesiai.csv" convert target "utf-8".
repeat i = 1 to extent(menesiai): 
    export delimiter "~t" i menesiai[i].
end.
output close.

output to "menesiai1.txt".
repeat i = 1 to extent(menesiai): 
   put unformatted substitute ("Mënuo &1 yra &2.", i, menesiai[i]) skip.
end.
output close.