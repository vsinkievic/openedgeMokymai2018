USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS pastatas:
   define public property aukstu_kiekis as integer no-undo get.
   private set.
   define public property maxKeliamasSvoris as integer no-undo get.
   private set.
   
   constructor public pastatas ():
       aukstu_kiekis = random(45,100).
       maxKeliamasSvoris = random(150,200).
   end constructor.
   
end class.