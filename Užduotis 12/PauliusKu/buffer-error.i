
    FOR EACH beforeCustomer:
        BUFFER beforeCustomer:SAVE-ROW-CHANGES NO-ERROR.
    END.
   
    
    CATCH e AS Progress.Lang.AppError :
        MESSAGE e:GetMessage(1) VIEW-AS ALERT-BOX.
        HIDE ALL.
    END.
    FINALLY: 
        ENABLE bCreate bDelete bUpdate WITH FRAME fr.
    END.
