/*define variable groupOneLimit as decimal no-undo init 100.*/
/*define variable priceIncrease1 as decimal init 0.         */
/*define variable totalIncrease1 as decimal init 0.         */

define variable groupTwoLimit as decimal no-undo init 100.
define variable priceIncrease2 as decimal init 0.
define variable totalIncrease2 as decimal init 0.

define variable groupThreeLimit as decimal no-undo init 500.
define variable priceIncrease3 as decimal init 0.
define variable totalIncrease3 as decimal init 0.

define variable totalIncrease2and3 as decimal no-undo init 0.

firstGroup:
do transaction:
    for each Item where Item.Price < 100 exclusive-lock:
        Item.Price = Item.Price * 1.1.
    end.
end.

secondAndThirdGroup:
do transaction:
    
    secondGroup:
    for each Item where (Item.Price >= 100 and Item.Price < 200) exclusive-lock:
        priceIncrease2 = Item.Price * 0.07.
        Item.Price = Item.Price * 1.07.
        totalIncrease2 = totalIncrease2 + priceIncrease2.
        totalIncrease2and3 = totalIncrease2and3 + priceIncrease2.
        if totalIncrease2 > 100 then do:
            message "Antros grupës bendras kainø padidinimas virðijo limità, pakeitimas nebus iðsaugomi" view-as alert-box.
            undo secondGroup, leave secondGroup.
        end.
    end.
    
    thirdGroup:
    for each Item where Item.Price >= 200 exclusive-lock:
        priceIncrease3 = Item.Price * 0.05.
        Item.Price = Item.Price * 1.05.
        totalIncrease3 = totalIncrease3 + priceIncrease3.
        totalIncrease2and3 = totalIncrease2and3 + priceIncrease3.
        if totalIncrease3 > 500 then do:
            message "Treèio grupës bendras kainø padidinimas virðijo limità, pakeitimas nebus iðsaugomi" view-as alert-box.
            undo thirdGroup, leave thirdGroup.
        end.
    end.
    
    if totalIncrease2and3 > 550 then do:
        message "Antros ir treèios grupiø bendras kainø padidinimas virðijo limità, pakeitimas nebus iðsaugomi" view-as alert-box.
        totalIncrease2and3 = 0.
        undo secondAndThirdGroup, leave secondAndThirdGroup.
    end.
end.

