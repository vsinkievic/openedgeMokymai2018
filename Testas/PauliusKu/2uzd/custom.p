DEFINE FRAME f.

DEFINE TEMP-TABLE ttinput NO-UNDO
  FIELD Nr AS INTEGER
  FIELD Tekstas AS CHARACTER FORMAT "x(70)"
  FIELD Ilgis AS INTEGER
  FIELD IlgisBeTarpu AS INTEGER.

DEFINE VARIABLE cinput as CHARACTER.

main-loop:
REPEAT:
    
    form cinput view-as editor size 10 by 10
    with frame f.
    
    update cinput
           with frame f.
           
    IF cinput = ""
    THEN LEAVE main-loop.       
    
    CREATE ttinput.
    ttinput.Tekstas = cinput.
    ttinput.Ilgis = LENGTH(cinput).
    
    cinput = TRIM( cinput ).
    DO WHILE INDEX( cinput, "  " ) > 0:
        cinput = REPLACE( cinput, "  ", " " ).
    END.
    
    ttinput.IlgisBeTarpu = LENGTH(cinput).
    
    //ivedamas ivestas tekstas, o ne pataisytas
    
    IF ttinput.IlgisBeTarpu <= 20
    THEN MESSAGE ttinput.Tekstas VIEW-AS ALERT-BOX.
    ELSE IF ttinput.IlgisBeTarpu > 20 AND ttinput.IlgisBeTarpu <= 40
    
    THEN MESSAGE SUBSTRING(ttinput.Tekstas, 1, 20) SKIP
                 SUBSTRING(ttinput.Tekstas, 21, 20) VIEW-AS ALERT-BOX.
                 
    ELSE IF ttinput.IlgisBeTarpu > 40
    THEN MESSAGE SUBSTRING(ttinput.Tekstas, 1, 20) SKIP
                 SUBSTRING(ttinput.Tekstas, 21, 20) SKIP
                 SUBSTRING(ttinput.Tekstas, 41) VIEW-AS ALERT-BOX.
    
    ASSIGN cinput = "".

END.                                                  