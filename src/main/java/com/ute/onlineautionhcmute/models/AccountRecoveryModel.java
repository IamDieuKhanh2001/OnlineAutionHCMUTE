package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.AccountRecovery;
import com.ute.onlineautionhcmute.beans.AuctionHistory;
import com.ute.onlineautionhcmute.beans.Category;
import com.ute.onlineautionhcmute.beans.User;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class AccountRecoveryModel {

    public static void add(User user, String code)
    {
        final String query = "INSERT INTO `account_recovery` (`user_id`, `code`, `status`) VALUES (:userID, :code, :status)";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("userID", user.getId())
                    .addParameter("code", code)
                    .addParameter("status", 0)
                    .executeUpdate();
        }
    }

    public static void updateStatusUsed(AccountRecovery accountRecovery)
    {
        final String query = "UPDATE `account_recovery` SET `status` = '1' WHERE `id` = :id";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("id", accountRecovery.getId())
                    .executeUpdate();
        }
    }

    public static AccountRecovery findCodeValid(User user, String code)
    {
        final String query = "SELECT * FROM `account_recovery` WHERE `code` = :code AND `user_id` = :userID AND `status` = '0'";
        try (Connection connection = DbUtils.getConnection())
        {
            List<AccountRecovery> list = connection.createQuery(query)
                    .addParameter("code", code)
                    .addParameter("userID", user.getId())
                    .executeAndFetch(AccountRecovery.class);

            if(list.size() == 0)
                return null;
            return list.get(0);
        }
    }
}
