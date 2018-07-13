define variable prekes as integer no-undo.
define variable I_grupe as decimal.
define variable II_grupe as decimal no-undo.
define variable III_grupe as decimal no-undo.
define variable padidinimas as decimal.
define variable bendraspadidinimas as decimal.
define variable bendraspadidinimasII as decimal no-undo.
define variable bendraspadidinimasIII as decimal no-undo.

define frame I_frame
    bendraspadidinimas
    Item.Price
    I_grupe
 with 3 col 10 down centered title "I grupë".

define frame II_frame
    bendraspadidinimasII
    Item.Price
    II_grupe
 with 3 col 10 down centered title "II grupë".
 
 define frame III_frame
    bendraspadidinimasIII
    Item.Price
    III_grupe
 with 3 col 10 down centered title "III grupë".
 
//output to "price_history.txt". 
Igrupe:
do transaction:
    for each item where Item.Price < 100:
        I_grupe = Item.Price * 1.1.
        padidinimas = I_grupe - Item.price.
        bendraspadidinimas = bendraspadidinimas + padidinimas.
        display bendraspadidinimas label "bPadidinimas" Item.Price label "Pradinë" I_grupe label "Padidinta" with frame I_frame. 
    end.
end.


do transaction:
    IIgrupe:
    do transaction:
        for each item where Item.Price > 100 and Item.Price < 200:
            do:
            II_grupe = Item.Price * 1.07.
            padidinimas = II_grupe - Item.price.
            bendraspadidinimasII = bendraspadidinimasII + padidinimas.
            
            display bendraspadidinimasII label "bPadidinimas" Item.Price label "Pradinë" II_grupe label "Padidinta" with frame II_frame.
            //if bendraspadidinimasII > 100 then undo IIgrupe, leave IIgrupe.
        end.  
    if bendraspadidinimasII > 100 then undo IIgrupe, leave IIgrupe.
    end.
    
    IIIgrupe:
    do transaction:
        for each item where Item.Price > 200:
            III_grupe = Item.Price * 1.05.
            padidinimas = III_grupe - Item.price.
            bendraspadidinimasIII = bendraspadidinimasIII + padidinimas.
            display bendraspadidinimasIII label "bPadidinimas" Item.Price label "Pradinë" III_grupe label "Padidinta" with frame III_frame.
            //if bendraspadidinimasIII > 500 then undo IIIgrupe, leave IIIgrupe.
        end.
        if bendraspadidinimasIII > 500 then undo IIIgrupe, leave IIIgrupe.    
    end.
    
    display bendraspadidinimasII bendraspadidinimasIII.
    if (bendraspadidinimasII + bendraspadidinimasIII) > 550 then undo, leave.
    end.
end.

//output close.
compile change-prices.p listing ziurim_tranzakcijas.lis