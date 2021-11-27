package com.ute.onlineautionhcmute.beans;
import java.security.Timestamp;
import java.util.Date;

public class Category {
    private int id;
    private String name;
    private Date create_time;
    private Date modified_time;

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
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

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public void setModified_time(Date modified_time) {
        this.modified_time = modified_time;
    }
}
