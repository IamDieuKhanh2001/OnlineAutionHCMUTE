package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.AuctionHistory;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

public class AuctionHistoryModel {
    public static void add(AuctionHistory auctionHistory)
    {
        final String query = "INSERT INTO `auction_history` (`product_id`, `user_id`, `deposit_price`) VALUES (:productID, :userID, :depositPrice)";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("productID", auctionHistory.getProduct_id())
                    .addParameter("userID", auctionHistory.getUser_id())
                    .addParameter("depositPrice", auctionHistory.getDeposit_price())
                    .executeUpdate();
        }
    }

    public static void delete(int auctionHistoryID)
    {
        final String query = "DELETE FROM `auction_history` WHERE `id` = :auctionHistoryID";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("auctionHistoryID", auctionHistoryID)
                    .executeUpdate();
        }
    }

    public static void deleteAllRecordByUserID(int userID)
    {
        final String query = "DELETE FROM `auction_history` WHERE `user_id` = :userID";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("userID", userID)
                    .executeUpdate();
        }
    }
}
