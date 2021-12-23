package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.AccountUpgrade;
import com.ute.onlineautionhcmute.beans.User;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class AccountUpgradeModel {

    public static void add(AccountUpgrade accountUpgrade)
    {
        final String query = "INSERT INTO `account_upgrade`(`user_id`, `status`) VALUES (:userID, :status)";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("userID", accountUpgrade.getUser_id())
                    .addParameter("status", accountUpgrade.getStatus())
                    .executeUpdate();
        }
    }

    public static void add(int userID, String status)
    {
        final String query = "INSERT INTO `account_upgrade`(`user_id`, `status`) VALUES (:userID, :status)";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("userID", userID)
                    .addParameter("status", status)
                    .executeUpdate();
        }
    }

    public static AccountUpgrade findByUserID(int userID)
    {
        final String query = "SELECT * FROM `account_upgrade` WHERE `user_id` = :userID";
        try (Connection connection = DbUtils.getConnection())
        {
            List<AccountUpgrade> list = connection.createQuery(query)
                    .addParameter("userID", userID)
                    .executeAndFetch(AccountUpgrade.class);
            if(list.size() == 0)
                return null;
            return list.get(0);
        }
    }

    public static AccountUpgrade findByID(int id)
    {
        final String query = "SELECT * FROM `account_upgrade` WHERE `id` = :id";
        try (Connection connection = DbUtils.getConnection())
        {
            List<AccountUpgrade> list = connection.createQuery(query)
                    .addParameter("id", id)
                    .executeAndFetch(AccountUpgrade.class);
            if(list.size() == 0)
                return null;
            return list.get(0);
        }
    }

    public static AccountUpgrade findByUser(User user)
    {
        final String query = "SELECT * FROM `account_upgrade` WHERE `user_id` = :userID";
        try (Connection connection = DbUtils.getConnection())
        {
            List<AccountUpgrade> list = connection.createQuery(query)
                    .addParameter("userID", user.getId())
                    .executeAndFetch(AccountUpgrade.class);
            if(list.size() == 0)
                return null;
            return list.get(0);
        }
    }

    public static List<AccountUpgrade> findAllByUser(User user)
    {
        final String query = "SELECT * FROM `account_upgrade` WHERE `user_id` = :userID";
        try (Connection connection = DbUtils.getConnection())
        {
            List<AccountUpgrade> list = connection.createQuery(query)
                    .addParameter("userID", user.getId())
                    .executeAndFetch(AccountUpgrade.class);
            return list;
        }
    }

    public static List<AccountUpgrade> findAllByStatus(String status)
    {
        final String query = "SELECT * FROM `account_upgrade` WHERE `status` = :status";
        try (Connection connection = DbUtils.getConnection())
        {
            List<AccountUpgrade> list = connection.createQuery(query)
                    .addParameter("status", status)
                    .executeAndFetch(AccountUpgrade.class);
            return list;
        }
    }

    public static AccountUpgrade findByUserStatus(User user, String status)
    {
        String query = "SELECT * FROM `account_upgrade` WHERE `user_id` = :userID AND `status` = :status";
        try (Connection connection = DbUtils.getConnection())
        {
            List<AccountUpgrade> list = connection.createQuery(query)
                    .addParameter("userID", user.getId())
                    .addParameter("status", status)
                    .executeAndFetch(AccountUpgrade.class);
            if(list.size() == 0)
                return null;
            return list.get(0);
        }
    }

    public static void update(AccountUpgrade accountUpgrade)
    {
        final String query = "UPDATE `account_upgrade` SET `user_id` = :userID, `status` = :status WHERE `id` = :id";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("userID", accountUpgrade.getUser_id())
                    .addParameter("status", accountUpgrade.getStatus())
                    .addParameter("id", accountUpgrade.getId())
                    .executeUpdate();
        }
    }

    public static List<AccountUpgrade.UpgradeApply> getListUpgradeApplyByStatus(String status)
    {
        final String query = "SELECT `a`.`id`, `a`.`user_id`, `a`.`status`, `u`.`username`, `u`.`firstname`, `u`.`lastname`, `u`.`email`, `u`.`phone` " +
                "FROM `account_upgrade` AS `a`, `users` AS `u` " +
                "WHERE `a`.`user_id` = `u`.`id` AND `a`.`status` = :status";
        try (Connection connection = DbUtils.getConnection())
        {
            List<AccountUpgrade.UpgradeApply> list = connection.createQuery(query)
                    .addParameter("status", status)
                    .executeAndFetch(AccountUpgrade.UpgradeApply.class);
            return list;
        }
    }
}
