{ui-cust.p}

close QUERY k-uzklausa.
OPEN QUERY k-uzklausa FOR EACH Customer where Customer.Name begins (klientoPavadinimas) by Customer.Balance descending.
browse k-langas:refresh() no-error.
