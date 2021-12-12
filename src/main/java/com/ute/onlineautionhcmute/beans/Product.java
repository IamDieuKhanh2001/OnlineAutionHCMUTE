package com.ute.onlineautionhcmute.beans;

import java.util.Date;

public class Product {
    private int id;
    private String name;
    private String description;
    private int product_type_id;
    private int user_id;
    private double price_start;
    private double price_step;
    private double price_current;
    private double price_buy_now;
    private Date end_time;
    private Date create_time;
    private Date modified_time;

    public Product(int id, String name, String description, int product_type_id, int user_id, double price_start, double price_step, double price_current, double price_buy_now) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.product_type_id = product_type_id;
        this.user_id = user_id;
        this.price_start = price_start;
        this.price_step = price_step;
        this.price_current = price_current;
        this.price_buy_now = price_buy_now;
    }

    public Product(int id, String name, String description, int product_type_id, int user_id, double price_start, double price_step, double price_current, double price_buy_now, Date end_time) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.product_type_id = product_type_id;
        this.user_id = user_id;
        this.price_start = price_start;
        this.price_step = price_step;
        this.price_current = price_current;
        this.price_buy_now = price_buy_now;
        this.end_time = end_time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getProduct_type_id() {
        return product_type_id;
    }

    public void setProduct_type_id(int product_type_id) {
        this.product_type_id = product_type_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public double getPrice_start() {
        return price_start;
    }

    public void setPrice_start(double price_start) {
        this.price_start = price_start;
    }

    public double getPrice_step() {
        return price_step;
    }

    public void setPrice_step(double price_step) {
        this.price_step = price_step;
    }

    public double getPrice_current() {
        return price_current;
    }

    public void setPrice_current(double price_current) {
        this.price_current = price_current;
    }

    public double getPrice_buy_now() {
        return price_buy_now;
    }

    public void setPrice_buy_now(double price_buy_now) {
        this.price_buy_now = price_buy_now;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Date getModified_time() {
        return modified_time;
    }

    public void setModified_time(Date modified_time) {
        this.modified_time = modified_time;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }
}
