define temp-table ttClient like Customer. 
define temp-table ttOrder like Order.  
define temp-table ttOrderLine like OrderLine.

define dataset dsUzduotis for ttClient, ttOrder, ttOrderLine
    data-relation rel1 for ttClient, ttOrder relation-fields(custnum, custnum) nested
    data-relation rel1 for ttOrder, ttOrderLine relation-fields(ordernum, ordernum) nested
    .



for each customer no-lock where Customer.Name begins "John": 
    create ttClient.
    buffer-copy Customer to ttClient.
    
/*    for each Order no-lock of Customer:          */
/*        create ttOrder.                          */
/*        buffer-copy Order to ttOrder.            */
/*                                                 */
/*        for each OrderLine no-lock of Order:     */
/*            create ttOrderLine.                  */
/*            buffer-copy OrderLine to ttOrderLine.*/
/*        end.                                     */
/*    end.                                         */
end.

dataset dsUzduotis:write-xml ("file", "Datasetai/example1.xml", true).

