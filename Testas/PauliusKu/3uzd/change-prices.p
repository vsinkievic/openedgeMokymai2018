DEFINE TEMP-TABLE ttItem LIKE Item BEFORE-TABLE beforeItem.  

DEFINE DATASET dsItem FOR ttItem.


DEFINE VARIABLE isum1 AS DECIMAL DECIMALS 2.
DEFINE VARIABLE isum23 AS DECIMAL DECIMALS 2.
DEFINE VARIABLE isum2 AS DECIMAL DECIMALS 2.
DEFINE VARIABLE isum3 AS DECIMAL DECIMALS 2.

trans1:
DO TRANSACTION:
    FOR EACH Item EXCLUSIVE-LOCK WHERE Item.Price < 100:
        isum1 = isum1 + Item.Price * 0.1.
        Item.Price = Item.Price * 1.1.
    END.
END.

trans23:
DO TRANSACTION:
    trans2:
    DO ON ERROR UNDO, LEAVE:
        FOR EACH Item WHERE Item.Price >= 100 AND Item.Price < 200:
            isum2 = isum2 + Item.Price * 0.07.
            Item.Price = Item.Price * 1.07.
            IF isum2 > 100
            THEN DO:
                UNDO trans2, 
                LEAVE trans2.
            END.    
        END.
    END.
    
    trans3:
    DO ON ERROR UNDO, LEAVE:
        FOR EACH Item WHERE Item.Price >= 200:
            isum3 = isum3 + Item.Price * 0.05.
            Item.Price = Item.Price * 1.05.
            IF isum2 > 500
            THEN DO:
                UNDO trans3, 
                LEAVE trans3.
            END.    
        END.
    END.
    
    IF isum2 + isum3 > 550
    THEN DO:
        UNDO trans23, 
        LEAVE trans23.
    END.        
END.

MESSAGE "I grupe: "isum1 "II grupe: " isum2 "III grupe: " isum3.