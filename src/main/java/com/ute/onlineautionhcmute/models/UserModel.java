package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.Category;
import com.ute.onlineautionhcmute.beans.User;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Dictionary;
import java.util.List;
import java.util.Map;

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
    public static List<User> findByPermissionID(int perrmissionID)
    {
        final String query = "SELECT * FROM `users` where user_type_id = :perrmissionID";
        try (Connection connection = DbUtils.getConnection())
        {
            List<User> list = connection.createQuery(query)
                    .addParameter("perrmissionID", perrmissionID)
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

    public static void updateEmail(int userID, String newEmail)
    {
        final String query = "UPDATE `users` SET `email` = :email, `modified_time` = :modifiedTime WHERE `id` = :userID";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("email", newEmail)
                    .addParameter("modifiedTime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()))
                    .addParameter("userID", userID)
                    .executeUpdate();
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
                    .addParameter("userID", user.getId())
                    .executeUpdate();
        }
    }

    public static void updatePasswordByID(int userID, String newPassword)
    {
        final String query = "UPDATE `users` SET `password` = :newPassword, `modified_time` = :modifiedTime WHERE `id` = :userID";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("userID", userID)
                    .addParameter("newPassword", newPassword)
                    .addParameter("modifiedTime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()))
                    .executeUpdate();
        }
    }
    public static void add(User c) {
        String insertSql = "INSERT INTO users (username, password, firstname, lastname, birthdate, address, email, phone, user_type_id,status) VALUES (:username,:password,:firstname,:lastname,:birthdate,:address,:email,:phone,:userTypeId,:status)";
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
                    .addParameter("status",c.getStatus())
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

    public static User findByEmail(String email)
    {
        final String query = "SELECT * FROM `users` WHERE `email` = :email";
        try (Connection connection = DbUtils.getConnection())
        {
            List<User> list = connection.createQuery(query)
                    .addParameter("email", email)
                    .executeAndFetch(User.class);
            if(list.size() == 0)
                return null;
            return list.get(0);
        }
    }

    public static void updateUserTypeID(User user, int newUserTypeID)
    {
        final String query = "UPDATE `users` SET `user_type_id` = :newUserTypeID WHERE `id` = :id";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("newUserTypeID", newUserTypeID)
                    .addParameter("id", user.getId())
                    .executeUpdate();
        }
    }

    public static void updateStatus(int userID, String status)
    {
        final String query = "UPDATE `users` SET `status` = :status WHERE `id` = :id";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("status", status)
                    .addParameter("id", userID)
                    .executeUpdate();
        }
    }

}
