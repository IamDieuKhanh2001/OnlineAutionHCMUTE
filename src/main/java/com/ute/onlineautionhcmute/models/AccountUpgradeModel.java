package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.AccountUpgrade;
import com.ute.onlineautionhcmute.beans.User;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

import java.util.Hashtable;
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
        final String query = "UPDATE `account_upgrade` SET `user_id` = :userID, `status` = :status";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("userID", accountUpgrade.getUser_id())
                    .addParameter("status", accountUpgrade.getStatus())
                    .executeUpdate();
        }
    }

}
