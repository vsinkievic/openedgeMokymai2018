{dataset.i}

define input-output parameter dataset for dsCustomer.

temp-table ttCustomer:tracking-changes = true.
create ttCustomer.
display ttCustomer.Custnum ttCustomer.Name ttCustomer.Country.
update ttCustomer.Custnum label "Kliento kodas" ttCustomer.Name label "Kliento vardas" ttCustomer.Country label "Salis".
temp-table ttCustomer:tracking-changes = false.