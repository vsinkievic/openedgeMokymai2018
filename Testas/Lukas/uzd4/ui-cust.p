define variable nameFragment as character no-undo.

define query qCust for Customer scrolling.

define browse dBust query qCust no-lock display
    Customer.Name Customer.Balance /*Order.Ship-Date*/
    with 100 down no-assign separators.