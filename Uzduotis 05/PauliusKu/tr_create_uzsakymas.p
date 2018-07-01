TRIGGER PROCEDURE FOR CREATE OF uzsakymas.
assign uzsakymas.numeris = next-value(sq_uzsakymo_nr). 
assign uzsakymas.data = now.