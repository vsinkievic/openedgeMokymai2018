define variable patvirtino as log no-undo.
define variable diena as integer no-undo.

if (day(today - 1) = 27 and month(today) = 6) or weekday(today) = 3
then do: 
    diena = day(today).
    message "Ðiandien yra 27".
end.
else do:
  //  repeat diena = 1 to 31: 
        message "Kokia ðiandien yra diena?"
           // view-as alert-box
            set diena .
            
/*       if patvirtino then leave.*/
/*    end.                        */
end.
display diena.