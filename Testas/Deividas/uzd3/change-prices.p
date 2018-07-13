define variable BendrasPadidejimas2 as decimal no-undo init 0.
define variable BendrasPadidejimas3 as decimal no-undo init 0.

/*do transaction:                                    */
/*                                                   */
/*    for each Item where Item.Price < 100:          */
/*        Item.Price = Item.Price + Item.Price * 0.1.*/
/*    end.                                           */
/*                                                   */
/*end.                                               */

BendraTranzakcija:
do transaction:
    Tranzakcija2:
    for each Item where Item.Price > 100 and Item.Price < 200:
        BendrasPadidejimas2 = BendrasPadidejimas2 + Item.Price * 0.07.
        Item.Price = Item.Price + Item.Price * 0.07.
        
     
    
    if BendrasPadidejimas2 > 100
        then do:
            display "II grupës padidëjimas" BendrasPadidejimas2.
            undo Tranzakcija2, leave Tranzakcija2.
        end.
    end.
    
    Tranzakcija3:
    for each Item where Item.Price > 200:
        BendrasPadidejimas3 = BendrasPadidejimas3 + Item.Price * 0.05.
        Item.Price = Item.Price + Item.Price * 0.05.
    
    if BendrasPadidejimas3 > 500
        then do:
            display "III grupës padidëjimas" BendrasPadidejimas3.
            undo Tranzakcija3, leave Tranzakcija3.
        end.
    end. 
       
    if BendrasPadidejimas2 + BendrasPadidejimas3 > 550
        then do:
            display "Bendras padidëjimas" BendrasPadidejimas3.
            undo BendraTranzakcija , leave BendraTranzakcija.
        end.
end.
