package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.AuctionHistory;
import com.ute.onlineautionhcmute.beans.Product;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

import java.util.ArrayList;
import java.util.List;

public class AuctionHistoryModel {

    public static AuctionHistory findMaxDepositPrice(Product product) {
        final String query = "SELECT * FROM auction_history WHERE deposit_price = (SELECT MAX(deposit_price) FROM auction_history where auction_history.product_id = :productID)";
        try (Connection con = DbUtils.getConnection()) {
            List<AuctionHistory> list = con.createQuery(query)
                    .addParameter("productID", product.getId())
                    .executeAndFetch(AuctionHistory.class);
            if (list.size() == 0) {
                return null;
            }
            return  list.get(0);
        }
    }
    public static List<AuctionHistory> findAllByProductID(int proID)
    {
        final String query = "SELECT * FROM auction_history WHERE `product_id` = :proID";
        try (Connection connection = DbUtils.getConnection())
        {
            List<AuctionHistory> list = connection.createQuery(query)
                    .addParameter("proID", proID)
                    .executeAndFetch(AuctionHistory.class);
            return list;
        }
    }
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

    public static void deleteByProductIdAndUserId(int productID,int userID)
    {
        final String query = "DELETE FROM auction_history WHERE product_id = :productID and user_id = :userID";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("productID", productID)
                    .addParameter("userID", userID)
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

    public static List<Integer> getListProductIDByUserID(int userID)
    {
        final String query = "SELECT DISTINCT `product_id` FROM `auction_history` WHERE `user_id` = :userID";
        try (Connection connection = DbUtils.getConnection())
        {
            List<AuctionHistory> list = connection.createQuery(query)
                    .addParameter("userID", userID)
                    .executeAndFetch(AuctionHistory.class);
            if(list.size() == 0)
                return null;

            List<Integer> listProductID = new ArrayList<Integer>();
            list.forEach((item)->{
                listProductID.add(item.getProduct_id());
            });
            return listProductID;
        }
    }
}
