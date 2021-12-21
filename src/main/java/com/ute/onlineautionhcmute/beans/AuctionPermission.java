package com.ute.onlineautionhcmute.beans;

import java.util.Date;

public class AuctionPermission {
    private int id;
    private int product_id;
    private int user_id;
    private String status;
    private Date create_time;

    public AuctionPermission(int id, int product_id, int user_id, String status) {
        this.id = id;
        this.product_id = product_id;
        this.user_id = user_id;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public String getStatus() {
        return status;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }
}
