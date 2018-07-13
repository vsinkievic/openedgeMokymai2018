define variable secondGroupItems as decimal no-undo.
define variable thirdGroupItems as decimal no-undo.
define variable secondAndThirdGroupItems as decimal no-undo.

do transaction:
    for each Item 
    where Item.Price < 100:
        Item.Price = Item.Price + Item.Price * 0.1.
    end.
end.

do transaction:
    for each Item
    where Item.Price >= 100 and Item.Price < 200:
        secondGroupItems = secondGroupItems + Item.Price * 0.07.
        Item.Price = Item.Price + Item.Price * 0.07.
        if secondGroupItems > 100 then undo.
    end.
    
    for each Item
    where Item.Price >= 200:
        thirdGroupItems = thirdGroupItems + Item.Price * 0.05.
        Item.Price = Item.Price + Item.Price * 0.05.
        if thirdGroupItems > 500 then undo.
    end.
    secondAndThirdGroupItems = secondGroupItems + thirdGroupItems.
    if secondAndThirdGroupItems > 550 then undo.
end.
