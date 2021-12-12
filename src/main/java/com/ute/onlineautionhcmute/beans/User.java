package com.ute.onlineautionhcmute.beans;

import java.util.Date;

public class User {
    private int id;
    private String username;
    private String password;
    private String firstname;
    private String lastname;
    private Date birthdate;
    private String address;
    private String email;
    private String phone;
    private int user_type_id;
    private String status;
    private Date create_time;
    private Date modified_time;
    private String avatar = "avata.png";

    public User()
    {

    }

    public User(int id) {
        this.id = id;
    }

    public User(int id, String username, String password, String firstname, String lastname, Date birthdate, String address, String email, String phone, int user_type_id) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.birthdate = birthdate;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.user_type_id = user_type_id;
    }

    public User(String username, String password, String firstname, String lastname, Date birthdate, String address, String email, String phone, int user_type_id) {
        this.username = username;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.birthdate = birthdate;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.user_type_id = user_type_id;
    }

    public String getAvatar() {
        return avatar;
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public String getAddress() {
        return address;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public int getUser_type_id() {
        return user_type_id;
    }

    public String getStatus() {
        return status;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setUser_type_id(int user_type_id) {
        this.user_type_id = user_type_id;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public void setModified_time(Date modified_time) {
        this.modified_time = modified_time;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public Date getModified_time() {
        return modified_time;
    }
}
