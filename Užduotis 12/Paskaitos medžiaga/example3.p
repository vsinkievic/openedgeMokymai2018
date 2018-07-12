define temp-table ttCustomer like Customer before-table befCustomer. 
define temp-table ttOrder like Order.  
define temp-table ttOrderLine like OrderLine.

define dataset dsUzduotis for ttCustomer, ttOrder, ttOrderLine
    data-relation rel1 for ttCustomer, ttOrder relation-fields(custnum, custnum) nested
    data-relation rel1 for ttOrder, ttOrderLine relation-fields(ordernum, ordernum) nested
    .   

define temp-table tCustomer like Customer before-table beftCustomer. 
define temp-table tOrder like Order.  
define temp-table tOrderLine like OrderLine.

define dataset dsKeitimai for tCustomer,tOrder,tOrderLine
    data-relation rel1 for tCustomer, tOrder relation-fields(custnum, custnum) nested
    data-relation rel1 for tOrder, tOrderLine relation-fields(ordernum, ordernum) nested
    .   


DEF DATA-SOURCE srccustomer FOR Customer .
DEF DATA-SOURCE srcOrder FOR order.
DEF DATA-SOURCE srcOrderLine FOR orderLine.

BUFFER ttcustomer:ATTACH-DATA-SOURCE(DATA-SOURCE srccustomer:HANDLE).
buffer ttOrder:attach-data-source (data-source srcOrder:handle).
buffer ttOrderLine:attach-data-source (data-source srcOrderLine:handle).

//data-source srcCustomer:fill-where-string = "where Customer.Name begins 'John'".
//data-source srcOrder:fill-where-string = "where false".
//data-source srcOrderLine:fill-where-string = "where ".

DATASET dsUzduotis:FILL().
define variable i as integer no-undo.
define variable c as integer no-undo.
define variable d as integer no-undo.
define variable u as integer no-undo.
for each ttCustomer:
    i = i + 1.
end.
message "Ið viso yra " i "áraðø".

run addComment (input-output dataset dsUzduotis).
for each ttCustomer: 
    case row-state(ttCustomer): 
        when row-created then c = c + 1.
        when row-modified then u = u + 1.
   end.
end.
for each befCustomer where row-state(befCustomer) = row-deleted: 
         d = d + 1.
end.
message subst("Created=&1 updated=&2 deleted=&3", c, u, d).


/*for each ttCustomer:                                                              */
/*    display ttCustomer.CustNum ttCustomer.name ttCustomer.comments format "x(20)".*/
/*end.                                                                              */

/*for each befCustomer:                      */
/*    buffer befCustomer:save-row-changes ().*/
/*end.                                       */

BUFFER ttcustomer:DETACH-DATA-SOURCE().
BUFFER ttOrder:DETACH-DATA-SOURCE().
BUFFER ttOrderLine:DETACH-DATA-SOURCE().

dataset dsKeitimai:get-changes(dataset dsUzduotis:handle).
dataset dskeitimai:write-xml ("file", "Datasetai/keitimai3.xml", true, "utf-8", ?, no, yes, yes).

dataset dsUzduotis:write-xml ("file", "Datasetai/example3.xml", true, "utf-8", ?, no, yes, yes).

procedure addComment:
    define input-output parameter dataset for dsUzduotis. 
    
    temp-table ttCustomer:tracking-changes = true.
    for each ttCustomer where ttCustomer.CustNum < 3: 
        ttCustomer.Comments = subst("Kliento numeris &1", ttCustomer.CustNum).
    end.
    find last ttCustomer. delete ttCustomer.
    create ttCustomer. ttCustomer.custnum = time.
    create ttCustomer. ttCustomer.custnum = time + 1.
    create ttCustomer. ttCustomer.custnum = time + 2.
    create ttCustomer. ttCustomer.custnum = time + 3.

    temp-table ttCustomer:tracking-changes = false.
end.

