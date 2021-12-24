package com.ute.onlineautionhcmute.beans;

import java.util.Date;

public class AccountUpgrade {

    public class UpgradeApply {
        private int id;
        private int user_id;
        private String status;
        private String username;
        private String firstname;
        private String lastname;
        private String email;
        private String phone;

        public UpgradeApply() {
        }

        public UpgradeApply(int id, int user_id, String status, String username, String firstname, String lastname, String email, String phone) {
            this.id = id;
            this.user_id = user_id;
            this.status = status;
            this.username = username;
            this.firstname = firstname;
            this.lastname = lastname;
            this.email = email;
            this.phone = phone;
        }

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
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

        public String getFirstname() {
            return firstname;
        }

        public void setFirstname(String firstname) {
            this.firstname = firstname;
        }

        public String getLastname() {
            return lastname;
        }

        public void setLastname(String lastname) {
            this.lastname = lastname;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }
    }

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
