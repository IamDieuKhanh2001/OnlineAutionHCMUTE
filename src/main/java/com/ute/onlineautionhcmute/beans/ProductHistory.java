package com.ute.onlineautionhcmute.beans;

import java.util.Date;

public class ProductHistory implements Comparable<ProductHistory>{
    private int id;
    private int product_id;
    private double price_bidding;
    private int user_id_holding;
    private Date create_time;

    //Phương thức cho colection sort so sánh sắp xếp 2 đối tượng
    public int compareTo(ProductHistory productHistory) {
        if (price_bidding == productHistory.price_bidding)
            return 0;
        else if (price_bidding > productHistory.price_bidding)
            return -1;
        else
            return 1;
    }
    public ProductHistory(int id, int product_id, double price_bidding, int user_id_holding) {
        this.id = id;
        this.product_id = product_id;
        this.price_bidding = price_bidding;
        this.user_id_holding = user_id_holding;
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
}
