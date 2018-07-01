 // proced�ra vis� klient� i�vedimui

display "Klient� ataskaita" skip(3) with frame x side-labels.

find first Customer no-lock.
do while available Customer:
    display 
            Customer.Id label "Kliento numeris:"
            Customer.Name label "Pavadinimas:"
            Customer.OrdersCount label "U�sakym� skai�ius:"
            Customer.OrdersTotal label "U�sakym� suma:" skip
        with side-labels frame x.
    for each Order where Order.CustomerId = Customer.Id:
        display Order.Id Order.Date Order.Amount skip
            with side-labels title "Kliento u�sakymai".
    end.
    pause.
    hide all.
    find next Customer no-lock.
end.