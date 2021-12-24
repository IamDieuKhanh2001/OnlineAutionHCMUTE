package com.ute.onlineautionhcmute.beans;

import java.util.Date;

public class Evaluation {
    private int id;
    private int product_id;
    private int assessor;
    private int user_id;
    private String type;
    private String comment;
    private Date create_time;

    public Evaluation() {
    }

    public Evaluation(int id, int assessor, int user_id, String type, String comment) {
        this.id = id;
        this.assessor = assessor;
        this.user_id = user_id;
        this.type = type;
        this.comment = comment;
    }
    public Evaluation(int id, int product_id,int assessor, int user_id, String type, String comment) {
        this.id = id;
        this.product_id=product_id;
        this.assessor = assessor;
        this.user_id = user_id;
        this.type = type;
        this.comment = comment;
    }

    public Evaluation(int id, int product_id, int assessor, int user_id, String type, String comment, Date create_time) {
        this.id = id;
        this.product_id = product_id;
        this.assessor = assessor;
        this.user_id = user_id;
        this.type = type;
        this.comment = comment;
        this.create_time = create_time;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setAssessor(int assessor) {
        this.assessor = assessor;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public int getId() {
        return id;
    }

    public int getAssessor() {
        return assessor;
    }

    public int getUser_id() {
        return user_id;
    }

    public String getType() {
        return type;
    }

    public String getComment() {
        return comment;
    }

    public Date getCreate_time() {
        return create_time;
    }
}
