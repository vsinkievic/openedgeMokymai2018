TRIGGER PROCEDURE FOR WRITE OF Item OLD BUFFER oldItem.


        create price_history.
        price_history.Useris = "Petriukas".
        price_history.Data = today.
        price_history.SenaKaina = oldItem.Price.
        price_history.NaujaKaina = Item.Price.
        
        
        
    