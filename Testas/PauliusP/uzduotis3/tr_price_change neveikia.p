TRIGGER PROCEDURE FOR WRITE OF Item.

for each item where Item.Price > 100 AND Item.Price < 200:
    assign
        II_grupe = Item.Price * 1.07.
        padidinimas = II_grupe - Item.price.
        bendraspadidinimasII = bendraspadidinimasII + padidinimas.
end.