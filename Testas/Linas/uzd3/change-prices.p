
define variable iTotalPriceChangeII as decimal no-undo init 0.
define variable iTotalPriceChangeIII as decimal no-undo init 0.


for each Item where Item.Price < 100:
    Item.Price = Item.Price * 1.1.
end.

transblkI:
do transaction:

    transblkII:
    do transaction:
        for each Item where Item.Price >= 100 and Item.Price < 200:
            iTotalPriceChangeII = iTotalPriceChangeII + Item.Price * 0.07.
            if iTotalPriceChangeII > 1 then undo, leave transblkII.
                Item.Price = Item.Price * 1.07.
        end.
    end.
    
    transblkIII:
    do transaction:
        for each Item where Item.Price >= 200:
            iTotalPriceChangeIII = iTotalPriceChangeIII + Item.Price * 0.05.
            if iTotalPriceChangeIII + iTotalPriceChangeIII > 550 then undo transblkI, leave transblkI.
            if iTotalPriceChangeIII > 500 then undo, leave transblkIII.
                Item.Price = Item.Price * 1.05.
        end.
    end.

end.


