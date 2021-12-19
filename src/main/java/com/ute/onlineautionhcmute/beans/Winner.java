package com.ute.onlineautionhcmute.beans;

import java.util.Date;

public class Winner {
    private int id;
    private int user_id;
    private int product_id;
    private Date create_time;

    public Winner() {
    }

    public Winner(int id, int user_id, int product_id) {
        this.id = id;
        this.user_id = user_id;
        this.product_id = product_id;
    }

    public Winner(int id, int user_id, int product_id, Date create_time) {
        this.id = id;
        this.user_id = user_id;
        this.product_id = product_id;
        this.create_time = create_time;
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

    public void setId(int id) {
        this.id = id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }
}
