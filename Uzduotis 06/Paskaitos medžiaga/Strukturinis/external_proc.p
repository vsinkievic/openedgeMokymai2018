    define input parameter pCustNum as integer no-undo.
    define output parameter iResult as int no-undo.
    
    find Customer no-lock where custnum = pCustnum.
    iResult = Customer.CustNum * 100.
