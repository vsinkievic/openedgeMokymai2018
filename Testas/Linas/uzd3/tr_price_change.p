TRIGGER PROCEDURE FOR Write OF Item OLD BUFFER OldItem.

    if Item.Price > OldItem.Price then do:

        create price_history.
        price_history.Itemnum = Item.Itemnum.
        price_history.ItemName = Item.ItemName.
        price_history.Old-price = OldItem.Price.
        price_history.New-price = Item.Price.    

    end.