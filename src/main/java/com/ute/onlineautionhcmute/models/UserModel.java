package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.User;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

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

    public static User findUserByID(int userID)
    {
        final String query = "SELECT * FROM `users` WHERE `id` = :userID";
        try (Connection connection = DbUtils.getConnection())
        {
            List<User> list = connection.createQuery(query).executeAndFetch(User.class);
            if(list.size() == 0)
                return null;
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
                    .addParameter("modifiedTime", new Date())
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

    public static void delete(int userID)
    {
        final String query = "DELETE FROM `users` WHERE `id` = :userID";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("userID", userID)
                    .executeUpdate();
        }
    }

}