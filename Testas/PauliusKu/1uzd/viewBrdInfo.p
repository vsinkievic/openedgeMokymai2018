
DEFINE VARIABLE cmonth AS CHARACTER NO-UNDO FORMAT "x(20)" EXTENT 12 
            INIT ["sausis", "vasaris", "kovas", "balandis", "gegužė", "birželis", 
            "liepa", "rugpjūtis", "rugsėjis", "spalis", "lapkritis", "gruodis"].
            
DEFINE VARIABLE cday AS CHARACTER NO-UNDO FORMAT "x(20)" EXTENT 7 
            INIT ["pirmadienis", "antradienis", "trečiadienis", "ketvirtadienis", 
            "penktadienis", "šeštaidienis", "sekmadienis"].
            
DEFINE VARIABLE dbirthdate AS DATE NO-UNDO FORMAT "9999-99-99".
DEFINE VARIABLE dtimenow AS DATE INIT TODAY.

UPDATE dbirthdate.

MESSAGE "gimimo data: " YEAR(dbirthdate)
                       cmonth[MONTH(dbirthdate)] 
                       DAY(dbirthdate) SKIP
        "dienų skaičius: " dtimenow - dbirthdate SKIP
        "savaites diena: " cday[WEEKDAY(dbirthdate) - 1]
        VIEW-AS ALERT-BOX.