define temp-table ttCustomer like Customer before-table befCustomer. 
define temp-table ttOrder like Order.  
define temp-table ttOrderLine like OrderLine.

define dataset dsUzduotis for ttCustomer, ttOrder, ttOrderLine
    data-relation rel1 for ttCustomer, ttOrder relation-fields(custnum, custnum) nested
    data-relation rel1 for ttOrder, ttOrderLine relation-fields(ordernum, ordernum) nested
    .   

DEF DATA-SOURCE srccustomer FOR Customer .
DEF DATA-SOURCE srcOrder FOR order.
DEF DATA-SOURCE srcOrderLine FOR orderLine.

BUFFER ttcustomer:ATTACH-DATA-SOURCE(DATA-SOURCE srccustomer:HANDLE).
buffer ttOrder:attach-data-source (data-source srcOrder:handle).
buffer ttOrderLine:attach-data-source (data-source srcOrderLine:handle).

data-source srcCustomer:fill-where-string = "where Customer.Name begins 'John'".
data-source srcOrder:fill-where-string = "where false".
//data-source srcOrderLine:fill-where-string = "where ".

DATASET dsUzduotis:FILL().

run addComment (input-output dataset dsUzduotis).

for each ttCustomer: 
    display ttCustomer.CustNum ttCustomer.name ttCustomer.comments format "x(20)".
end.

/*for each befCustomer:                      */
/*    buffer befCustomer:save-row-changes ().*/
/*end.                                       */

BUFFER ttcustomer:DETACH-DATbefore-buffer befCustomerA-SOURCE().
BUFFER ttOrder:DETACH-DATA-SOURCE().
BUFFER ttOrderLine:DETACH-DATA-SOURCE().


dataset dsUzduotis:write-xml ("file", "Datasetai/example2.xml", true, "utf-8", ?, no, yes, yes).

procedure addComment:
    define input-output parameter dataset for dsUzduotis. 
    
    temp-table ttCustomer:tracking-changes = true.
    for each ttCustomer: 
        ttCustomer.Comments = subst("Kliento numeris &1", ttCustomer.CustNum).
    end.
    temp-table ttCustomer:tracking-changes = false.
end.

