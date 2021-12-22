package com.ute.onlineautionhcmute.beans;

import java.util.Date;

public class EmailConfirm {
    private int id;
    private int user_id;
    private String purpose;
    private String status;
    private String json_data;
    private String hash;
    private Date create_time;

    public EmailConfirm() {
    }

    public EmailConfirm(int id, int user_id, String purpose, String status, String json_data, Date create_time) {
        this.id = id;
        this.user_id = user_id;
        this.purpose = purpose;
        this.status = status;
        this.json_data = json_data;
        this.create_time = create_time;
    }

    public EmailConfirm(int id, int user_id, String purpose, String status, String json_data, String hash, Date create_time) {
        this.id = id;
        this.user_id = user_id;
        this.purpose = purpose;
        this.status = status;
        this.json_data = json_data;
        this.hash = hash;
        this.create_time = create_time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getJson_data() {
        return json_data;
    }

    public void setJson_data(String json_data) {
        this.json_data = json_data;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }
}
