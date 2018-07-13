define variable months as character no-undo 
    init "Sausis,Vasaris,Kovas,Balandis,Geguþë,Birþelis,Liepa,Rugpjûtis,Rugsëjis,Spalis,Lapkritis,Gruodis".    
define variable weekdays as character no-undo
    init "Sekmadienis,Pirmadienis,Antradienis,Treèiadienis,Ketvirtadienis,Penktadienis,Ðeðtadienis".
define variable dateOfBirth as date no-undo label "Gimimo diena" format "9999-99-99".
define variable yearOfBirth as int no-undo.
define variable monthOfBirth as character no-undo.
define variable dayOfBirth as int no-undo.
define variable weekdayOfBirth as character no-undo.
define variable daysLived as int no-undo.

update dateOfBirth help "Áveskite savo gimimo dienà.".

yearOfBirth = year(dateOfBirth).
monthOfBirth = entry(month(dateOfBirth),months,",").
dayOfBirth = day(dateOfBirth).
weekdayOfBirth = entry(weekday(dateOfBirth),weekdays,",").
daysLived = today - dateOfBirth.

message "1. Gimimo data: " yearOfBirth monthOfBirth dayOfBirth skip
        "2. Pragyventø dienø skaièius: " daysLived skip
        "3. Gimimo savaitës diena: " weekdayOfBirth view-as alert-box.


