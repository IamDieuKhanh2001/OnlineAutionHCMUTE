package com.ute.onlineautionhcmute.beans;

import java.util.Date;

public class AccountRecovery {
    private int id;
    private int user_id;
    private String code;
    private int status;
    private Date create_time;

    public AccountRecovery() {
    }

    public AccountRecovery(int id, int user_id, String code, int status, Date create_time) {
        this.id = id;
        this.user_id = user_id;
        this.code = code;
        this.status = status;
        this.create_time = create_time;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public int getId() {
        return id;
    }

    public int getUser_id() {
        return user_id;
    }

    public String getCode() {
        return code;
    }

    public Date getCreate_time() {
        return create_time;
    }
}
