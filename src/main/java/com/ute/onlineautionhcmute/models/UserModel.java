package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.Category;
import com.ute.onlineautionhcmute.beans.User;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class UserModel {

    public static List<User> findAll()
    {
        final String query = "SELECT * FROM `users`";
        try (Connection connection = DbUtils.getConnection())
        {
            List<User> list = connection.createQuery(query)
                                        .executeAndFetch(User.class);
            return list;
        }
    }
    public static User findByUsername(String username) {
        final String query = "select * from users where username = :username";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("username", username)
                    .executeAndFetch(User.class);
            if (list.size() == 0) {
                return null;
            }
            return  list.get(0);
        }
    }

    public static User findById(int id) {
        final String query = "select * from users where id = :id";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("id", id)
                    .executeAndFetch(User.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }

    public static void updateInformation(User user)
    {
        final String query = "UPDATE `users` SET `firstname` = :firstname, `lastname` = :lastname, `birthdate` = :birthdate, `address` = :address, `email` = :email, `phone` = :phone, `modified_time` = :modifiedTime WHERE `id` = :userID";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("firstname", user.getFirstname())
                    .addParameter("lastname", user.getLastname())
                    .addParameter("birthdate", user.getBirthdate())
                    .addParameter("address", user.getAddress())
                    .addParameter("email", user.getEmail())
                    .addParameter("phone", user.getPhone())
                    .addParameter("modifiedTime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()))
                    .executeUpdate();
        }
    }

    public static void updatePasswordByID(int userID, String newPassword)
    {
        final String query = "UPDATE `users` SET `password` = :newPassword WHERE `id` = :userID";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("userID", userID)
                    .addParameter("newPassword", newPassword)
                    .executeUpdate();
        }
    }
    public static void add(User c) {
        String insertSql = "INSERT INTO users (username, password, firstname, lastname, birthdate, address, email, phone, user_type_id, avatar) VALUES (:username,:password,:firstname,:lastname,:birthdate,:address,:email,:phone,:userTypeId,:avatar)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("username", c.getUsername())
                    .addParameter("password", c.getPassword())
                    .addParameter("firstname", c.getFirstname())
                    .addParameter("lastname", c.getLastname())
                    .addParameter("birthdate", c.getBirthdate())
                    .addParameter("address", c.getAddress())
                    .addParameter("email", c.getEmail())
                    .addParameter("phone", c.getPhone())
                    .addParameter("userTypeId", c.getUser_type_id())
                    .addParameter("avatar", c.getAvatar())
                    .executeUpdate();
        }
    }
    public static void delete(int userID)
    {
        final String query = "DELETE FROM users WHERE id = :id";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("id", userID)
                    .executeUpdate();
        }
    }

}
