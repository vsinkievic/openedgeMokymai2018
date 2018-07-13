define variable months as character no-undo 
    init "Sausis,Vasaris,Kovas,Balandis,Gegu��,Bir�elis,Liepa,Rugpj�tis,Rugs�jis,Spalis,Lapkritis,Gruodis".    
define variable weekdays as character no-undo
    init "Sekmadienis,Pirmadienis,Antradienis,Tre�iadienis,Ketvirtadienis,Penktadienis,�e�tadienis".
define variable dateOfBirth as date no-undo label "Gimimo diena" format "9999-99-99".
define variable yearOfBirth as int no-undo.
define variable monthOfBirth as character no-undo.
define variable dayOfBirth as int no-undo.
define variable weekdayOfBirth as character no-undo.
define variable daysLived as int no-undo.

update dateOfBirth help "�veskite savo gimimo dien�.".

yearOfBirth = year(dateOfBirth).
monthOfBirth = entry(month(dateOfBirth),months,",").
dayOfBirth = day(dateOfBirth).
weekdayOfBirth = entry(weekday(dateOfBirth),weekdays,",").
daysLived = today - dateOfBirth.

message "1. Gimimo data: " yearOfBirth monthOfBirth dayOfBirth skip
        "2. Pragyvent� dien� skai�ius: " daysLived skip
        "3. Gimimo savait�s diena: " weekdayOfBirth view-as alert-box.


