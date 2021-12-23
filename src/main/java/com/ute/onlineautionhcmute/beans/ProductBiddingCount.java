package com.ute.onlineautionhcmute.beans;

import java.util.Date;

public class ProductBiddingCount {
    private int id;
    private int product_id;
    private double price_bidding;
    private int user_id_holding;
    private Date create_time;
    private int quantity;

    public ProductBiddingCount(int id, int product_id, double price_bidding, int user_id_holding, Date create_time, int quantity) {
        this.id = id;
        this.product_id = product_id;
        this.price_bidding = price_bidding;
        this.user_id_holding = user_id_holding;
        this.create_time = create_time;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public double getPrice_bidding() {
        return price_bidding;
    }

    public int getUser_id_holding() {
        return user_id_holding;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public void setPrice_bidding(double price_bidding) {
        this.price_bidding = price_bidding;
    }

    public void setUser_id_holding(int user_id_holding) {
        this.user_id_holding = user_id_holding;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
