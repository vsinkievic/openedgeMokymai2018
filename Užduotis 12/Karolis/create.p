{dataset/dataset.i}

define input-output parameter dataset for dsTable.

temp-table ttCustomer:tracking-changes = true.

create ttCustomer.
     display ttCustomer.Cust-Num ttCustomer.City ttCustomer.Country.
     update ttCustomer.Cust-Num label "�veskite kliento kod�" ttCustomer.City label "�veskite miest�" 
            ttCustomer.Country label "�veskite �al�".

temp-table ttCustomer:tracking-changes = false.