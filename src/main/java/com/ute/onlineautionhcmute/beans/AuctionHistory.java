package com.ute.onlineautionhcmute.beans;

import java.util.Date;

public class AuctionHistory {
    private int id;
    private int product_id;
    private int user_id;
    private double deposit_price;
    private Date create_time;
    private Date modified_time;

    public AuctionHistory(int id, int product_id, int user_id, double deposit_price) {
        this.id = id;
        this.product_id = product_id;
        this.user_id = user_id;
        this.deposit_price = deposit_price;
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

    public void setDeposit_price(double deposit_price) {
        this.deposit_price = deposit_price;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public void setModified_time(Date modified_time) {
        this.modified_time = modified_time;
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

    public double getDeposit_price() {
        return deposit_price;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public Date getModified_time() {
        return modified_time;
    }
}
