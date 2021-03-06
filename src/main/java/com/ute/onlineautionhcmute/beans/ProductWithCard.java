package com.ute.onlineautionhcmute.beans;

import java.util.Date;

public class ProductWithCard {
    private int id;
    private int user_id;
    private String name;
    private double price_current;
    private String firstname;
    private String lastname;
    private double price_buy_now;
    private Date create_time;
    private int user_id_holding_price;

    public int getUser_id_holding_price() {
        return user_id_holding_price;
    }

    public void setUser_id_holding_price(int user_id_holding_price) {
        this.user_id_holding_price = user_id_holding_price;
    }

    public ProductWithCard(int id, String name, double price_current, String firstname, String lastname, double price_buy_now, Date create_time) {
        this.id = id;
        this.name = name;
        this.price_current = price_current;
        this.firstname = firstname;
        this.lastname = lastname;
        this.price_buy_now = price_buy_now;
        this.create_time = create_time;
    }

    public ProductWithCard(int id, int user_id, String name, double price_current, String firstname, String lastname, double price_buy_now, Date create_time) {
        this.id = id;
        this.user_id = user_id;
        this.name = name;
        this.price_current = price_current;
        this.firstname = firstname;
        this.lastname = lastname;
        this.price_buy_now = price_buy_now;
        this.create_time = create_time;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public ProductWithCard() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice_current(double price_current) {
        this.price_current = price_current;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public void setPrice_buy_now(double price_buy_now) {
        this.price_buy_now = price_buy_now;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public String getName() {
        return name;
    }

    public double getPrice_current() {
        return price_current;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public double getPrice_buy_now() {
        return price_buy_now;
    }

    public Date getCreate_time() {
        return create_time;
    }
}
