package com.ute.onlineautionhcmute.beans;

import java.util.Date;

public class ProductType {
    private int id;
    private String name;
    private int category_id;
    private Date create_time;
    private Date modified_time;

    public ProductType(int id, String name, int category_id) {
        this.id = id;
        this.name = name;
        this.category_id = category_id;
    }

    public ProductType(int id, String name, int category_id, Date create_time, Date modified_time) {
        this.id = id;
        this.name = name;
        this.category_id = category_id;
        this.create_time = create_time;
        this.modified_time = modified_time;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getCategory_id() {
        return category_id;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public Date getModified_time() {
        return modified_time;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public void setModified_time(Date modified_time) {
        this.modified_time = modified_time;
    }
}
