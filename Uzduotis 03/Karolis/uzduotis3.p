define variable indeksas as integer no-undo.
define variable vardas as character no-undo format "x(20)".
define variable counter as integer no-undo.
define variable vyriskas as integer no-undo.
define variable moteriskas as integer no-undo.
define variable i as integer no-undo.

output to "C:\mokymai\Karolis\Names_man.txt". 
input from "C:\mokymai\Karolis\Names.txt".
repeat:
    import unformatted vardas. 
    indeksas = length(vardas).  
 if substr(vardas, indeksas) = "s" then do:
       if index(vardas, " ") <> 0 then do:
        i = i + 1.
        end.
     vyriskas = vyriskas + 1.
   export vardas.                 
  end.          
 end.      
output close.                     
input close.

output to "C:\mokymai\Karolis\Names_woman.txt". 
input from "C:\mokymai\Karolis\Names.txt".
repeat:
    import unformatted vardas. 
    indeksas = length(vardas).
 if substr(vardas, indeksas) <> "s" then do:
     if index(vardas, " ") <> 0 then do:
        counter = counter + 1.
        end.
     moteriskas = moteriskas + 1.
   export vardas.                 
  end.          
 end.      
output close.                     
input close.

output to "C:\mokymai\Karolis\Names_update.txt". 
input from "C:\mokymai\Karolis\Names.txt".
repeat:
    import unformatted vardas. 
    if vardas = "Maryte" then vardas = "Marytë".
     if vardas = "Ona Onute" then vardas = "Ona Onutë".
     if vardas = "Kestutis" then vardas = "Kæstutis".
     if vardas = "Aşuolas" then vardas = "Àşuolas".
   export vardas.                 
  end.               
output close.                     
input close.

output to "C:\mokymai\Karolis\Names_ataskaita.txt".
put unformatted substitute ("Vyriğkø vardø skaièius: &1, tarp kuriø &2 dvigubi. ", vyriskas, i).
put unformatted substitute ("Moteriğkø vardø skaièius: &1, tarp kuriø &2 dvigubi", moteriskas, counter).
output close.
