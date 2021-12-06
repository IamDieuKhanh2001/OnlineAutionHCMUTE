package com.ute.onlineautionhcmute.beans;

import java.util.Date;

public class WatchList {
    private int id;
    private int user_id;
    private int product_id;
    private Date create_time;

    public WatchList(int user_id, int product_id) {
        this.user_id = user_id;
        this.product_id = product_id;
    }

    public int getId() {
        return id;
    }

    public int getUser_id() {
        return user_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public Date getCreate_time() {
        return create_time;
    }
}
