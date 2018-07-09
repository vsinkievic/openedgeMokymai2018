routine-level on error undo, throw.

class kLygtis:
    define public property a as decimal no-undo get.
    private set.
    define public property b as decimal no-undo get.
    private set.
    define public property c as decimal no-undo get.
    private set.
    define public property x1 as decimal no-undo get.
    private set.
    define public property x2 as decimal no-undo get.
    private set.
    
    constructor public kLygtis (a as decimal, b as decimal, 
        c as decimal):
            
        this-object:a = a.
        this-object:b = b.
        this-object:c = c.
    
        if det() < 0 or a = 0 then do:
            x1 = ?.
            x2 = ?.
        end.
        else if this-object:det() > 0 then do:
            x1 = (- b + sqrt(this-object:det())) / 2 * a.
            x2 = (- b - sqrt(this-object:det())) / 2 * a.
        end.
        else if this-object:det() = 0 then do:
            x1 = (- b) / 2 * a.
            x2 = ?.
        end.
    end.
    
    method public log sprestina():
        if this-object:det() < 0 or this-object:a = 0 then return false.
        else return true.
    end.
    
    method public decimal det():  // determinantas
        return this-object:b * this-object:b - 4 * this-object:a * this-object:c.
    end.
    
    method public void toScreen():  // parodo rezultatus ant ekrano
        display "Kvadratinës lygties sprendimas" skip.
        display substitute ("Ávestos reikðmës: a = &1, b = &2, c = &3", 
        this-object:a, this-object:b, this-object:c) format "x(70)" no-labels skip.
        display "Sprendimas:" skip "x1 = " x1 "x2 = " x2.
    end.
    
        
end class.    
