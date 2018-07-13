TRIGGER PROCEDURE FOR Write OF Item old buffer oldItem.
                   
   if Item.Price <> oldItem.Price
   then do:
       create Price_history.
          Price_history.Data = today.
          Price_history.Naudotojas = "Antanas".
          Price_history.Sena_kaina = oldItem.Price.
          Price_history.Nauja_kaina = Item.Price.
   end.   
