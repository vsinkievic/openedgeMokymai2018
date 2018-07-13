trigger procedure for write of Item new buffer newItem old buffer oldItem.

create price_history.
    price_history.dateOfChange = today.
    price_history.newPrice = newItem.Price.
    price_history.oldPrice = oldItem.Price.