TRIGGER PROCEDURE FOR WRITE OF ITEM NEW BUFFER newitem.

DEFINE VARIABLE dtimenow AS DATETIME INIT NOW.

    CREATE price_history.
    price_history.Name = "SomeName".
    price_history.Itemnum = newitem.Itemnum.
    price_history.date = dtimenow.
    price_history.Newprice = newitem.price.    