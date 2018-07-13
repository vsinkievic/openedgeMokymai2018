define variable tekstas as character no-undo view-as editor size 40 by 2 
               scrollbar-vertical max-chars 70 label "Teksto editorius".
define variable pataisytasTekstas as character no-undo view-as editor size 40 by 2 
                         scrollbar-vertical max-chars 70 label "Pataisytas tekstas".  
define variable numeris as integer no-undo.
define variable vidurkisTeksto as decimal no-undo.
define variable vidurkisNetaisyto as decimal no-undo.
                                      
define temp-table ttTekstas no-undo
       field Nr as integer 
       field Tekstas as character format "x(70)"
       field Ilgis as integer
       field IlgisBeTarpu as integer.   
       
form tekstas with frame fTekstas.
                                                                            
repeat:
    update tekstas with frame fTekstas.    
    if length(tekstas) > 0 then do:
        numeris = numeris + 1.
    pataisytasTekstas = trim(tekstas).
    do while index(pataisytasTekstas, "  ") > 0:
        pataisytasTekstas = replace(pataisytasTekstas, "  ", " ").
    end.  
    create ttTekstas.
       ttTekstas.Nr = numeris.
       ttTekstas.Tekstas = tekstas.
       ttTekstas.Ilgis = length(tekstas).
       ttTekstas.IlgisBeTarpu = length(pataisytasTekstas). 
       
    if length(pataisytasTekstas) <= 20
    then message substring(pataisytasTekstas,1,20) view-as alert-box.

    else if length(pataisytasTekstas) > 20 and length(pataisytasTekstas) <= 40
    then message substring(pataisytasTekstas,1,20) skip
             substring(pataisytasTekstas,20,20) view-as alert-box.   
     
    else if length(pataisytasTekstas) > 40
    then message substring(pataisytasTekstas,1,20) skip
                 substring(pataisytasTekstas,20,20) skip
                 substring(pataisytasTekstas,40) view-as alert-box.
    end.
    else do: undo, leave.
    end.
end.

for each ttTekstas:
    vidurkisTeksto = vidurkisTeksto + ttTekstas.Ilgis.
    vidurkisNetaisyto = vidurkisNetaisyto + ttTekstas.IlgisBeTarpu.
    display ttTekstas.Nr.
    display vidurkisTeksto(average) label "Teksto ilgis".
    display vidurkisNetaisyto(average) label "Pataisyto teksto ilgis".
end.


    
