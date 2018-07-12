{dataset/dataset.i}

define input-output parameter dataset for dsTable.

temp-table ttCustomer:tracking-changes = true.

create ttCustomer.
     display ttCustomer.Cust-Num ttCustomer.City ttCustomer.Country.
     update ttCustomer.Cust-Num label "Áveskite kliento kodà" ttCustomer.City label "Áveskite miestà" 
            ttCustomer.Country label "Áveskite ğalá".

temp-table ttCustomer:tracking-changes = false.