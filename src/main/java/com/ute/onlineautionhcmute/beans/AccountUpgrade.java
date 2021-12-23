package com.ute.onlineautionhcmute.beans;

import java.util.Date;

public class AccountUpgrade {
    private int id;
    private int user_id;
    private String status;
    private Date create_time;

    public AccountUpgrade() {
    }

    public AccountUpgrade(int id, int user_id, String status, Date create_time) {
        this.id = id;
        this.user_id = user_id;
        this.status = status;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }
}
