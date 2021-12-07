package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.AuctionHistory;
import com.ute.onlineautionhcmute.beans.User;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

public class AccountRecoveryModel {

    public static void add(User user, String code)
    {
        final String query = "INSERT INTO `account_recovery` (`user_id`, `code`) VALUES (:userID, :code)";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("userID", user.getId())
                    .addParameter("code", code)
                    .executeUpdate();
        }
    }

    public static boolean isValidCode(String user, String code)
    {
        final String query = "SELECT `id` FROM `account_recovery` WHERE `code` = :code";
        return false;
    }
}
