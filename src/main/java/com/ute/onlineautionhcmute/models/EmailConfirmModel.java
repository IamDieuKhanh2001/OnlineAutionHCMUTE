package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.EmailConfirm;
import com.ute.onlineautionhcmute.beans.Evaluation;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class EmailConfirmModel {
    public static void add(int userID, String purpose, String status, String jsonData, String hash)
    {

        final String query = "INSERT INTO `email_confirm`(`user_id`, `purpose`, `status`, `json_data`, `hash`) " +
                "VALUES(:userID, :purpose, :status, :jsonData, :hash)";

        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("userID", userID)
                    .addParameter("purpose", purpose)
                    .addParameter("status", status)
                    .addParameter("jsonData", jsonData)
                    .addParameter("hash", hash)
                    .executeUpdate();
        }
    }

    public static void add(EmailConfirm emailConfirm)
    {
        final String query = "INSERT INTO `email_confirm`(`user_id`, `purpose`, `status`, `json_data`, `hash`) " +
                "VALUES(:userID, :purpose, :status, :jsonData, :hash)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("userID", emailConfirm.getUser_id())
                    .addParameter("purpose", emailConfirm.getPurpose())
                    .addParameter("status", emailConfirm.getStatus())
                    .addParameter("jsonData", emailConfirm.getJson_data())
                    .addParameter("hash", emailConfirm.getHash())
                    .executeUpdate();
        }
    }

    public static EmailConfirm check(int userID, String purpose, String status, String hash)
    {
        final String query = "SELECT * FROM `email_confirm` WHERE `user_id` = :userID " +
                "AND `purpose` = :purpose " +
                "AND `status` = :status " +
                "AND `hash` = :hash";
        try (Connection con = DbUtils.getConnection()) {
            List<EmailConfirm> list = con.createQuery(query)
                    .addParameter("userID", userID)
                    .addParameter("purpose", purpose)
                    .addParameter("status", status)
                    .addParameter("hash", hash)
                    .executeAndFetch(EmailConfirm.class);
            if(list.size() == 0)
                return null;
            return list.get(0);
        }
    }

    public static void updateStatus(int id, String newStatus)
    {
        final String query = "UPDATE `email_confirm` SET `status` = :newStatus WHERE `id` = :id";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("id", id)
                    .addParameter("newStatus", newStatus)
                    .executeUpdate();
        }
    }
}