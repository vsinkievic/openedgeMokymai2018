define variable bendrasPadidejimas2 as decimal no-undo.
define variable bendrasPadidejimas3 as decimal no-undo.
define variable bendrasPadidejimas as decimal no-undo.

tranzakcija1:
do transaction:
    for each Item where Item.Price < 100:
        Item.Price = Item.Price + Item.Price * 0.1.
    end.
end.

bendraTranzakcija:
do transaction:
   tranzakcija2:
        for each Item where Item.Price >= 100 and Item.Price < 200:
            bendrasPadidejimas2 = bendrasPadidejimas2 + Item.Price * 0.07.
            Item.Price = Item.Price + Item.Price * 0.07.
            if (bendrasPadidejimas2 > 100)
            then do: message "Per daug padidëjo 2-os grupës bendra kaina" view-as alert-box.
            undo tranzakcija2, leave tranzakcija2.
            end.
        end.   
    tranzakcija3:
        for each Item where Item.Price >= 200:
            bendrasPadidejimas3 = bendrasPadidejimas3 + Item.Price * 0.05.
            Item.Price = Item.Price + Item.Price * 0.05.
            if (bendrasPadidejimas3 > 500)
            then do: message "Per daug padidëjo 3-os grupës bendra kaina" view-as alert-box.
            undo tranzakcija3, leave tranzakcija3.
            end.
        end. 
        
        display bendrasPadidejimas2.
        display bendrasPadidejimas3.
        bendrasPadidejimas = bendrasPadidejimas2 + bendrasPadidejimas3.
        display bendrasPadidejimas.
        if (bendrasPadidejimas > 550) 
        then do: message "Per daug padidëjo bendra 2-os ir 3-os grupiø kaina" view-as alert-box.
        undo bendraTranzakcija, leave bendraTranzakcija.  
        end.    
            
end.    