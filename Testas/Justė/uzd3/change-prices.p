define variable overall2 as decimal init 0.
define variable overall3 as decimal init 0.
define variable overall2_3 as decimal init 0.
define variable amount as decimal.

        
for each sportscopy.Item where Item.Price < 100:
    amount = Item.Price * 0.1.
    Item.Price = Item.Price + amount.
end.

do transaction:
    
    for each sportscopy.Item where Item.Price >=100 and Item.Price < 200:
        amount = Item.Price * 0.07.
        overall2 = overall2 + amount.
        if overall2 > 100 then undo, leave.
        Item.Price = Item.Price + amount.
    end.
    
    for each sportscopy.Item where Item.Price >=200:
        amount = Item.Price * 0.05.
        overall3 = overall3 + amount.
        if overall3 > 500 then undo, leave.
    end.
    
   overall2_3 = overall2 + overall3.
   if overall2_3 > 550 then undo, leave.
   
end.
