TRIGGER PROCEDURE FOR CREATE OF Uzsakymas.


ASSIGN Uzsakymas.UzsakymoNr = NEXT-VALUE(KitasUzsakymoNumeris).
    
Uzsakymas.Data = TODAY.



