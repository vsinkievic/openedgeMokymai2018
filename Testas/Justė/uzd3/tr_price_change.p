trigger procedure for write of Item new buffer newbuf old buffer oldbuf .

create price_history.
price_history.UpdatedBy = userid.
price_history.DateTime = now.
price_history.Price = oldbuf.Price.
price_history.UpdatedPrice = newbuf.Price.
