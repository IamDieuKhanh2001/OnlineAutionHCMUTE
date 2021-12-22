package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.AuctionPermission;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class AuctionPermissionModel {
    public static AuctionPermission findByProductIdAndUserId(int productID,int userID,String status)
    {
        final String query = "SELECT * FROM auction_permission WHERE product_id = :productID and user_id = :userID and status = :status";
        try (Connection connection = DbUtils.getConnection())
        {
            List<AuctionPermission> list = connection.createQuery(query)
                    .addParameter("productID", productID)
                    .addParameter("userID", userID)
                    .addParameter("status", status)
                    .executeAndFetch(AuctionPermission.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }
    public static List<AuctionPermission> findProductPermissionByProductId(int productID,String status)
    {
        final String query = "SELECT * FROM auction_permission WHERE product_id = :productID and status = :status";
        try (Connection connection = DbUtils.getConnection())
        {
            List<AuctionPermission> list = connection.createQuery(query)
                    .addParameter("productID", productID)
                    .addParameter("status", status)
                    .executeAndFetch(AuctionPermission.class);
            return list;
        }
    }
    public static void add(AuctionPermission auctionPermission)
    {
        final String query = "INSERT INTO auction_permission (product_id, user_id, status) VALUES (:productId,:userId,:status)";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("productId", auctionPermission.getProduct_id())
                    .addParameter("userId", auctionPermission.getUser_id())
                    .addParameter("status", auctionPermission.getStatus())
                    .executeUpdate();
        }
    }
    public static void update(AuctionPermission auctionPermission)
    {
        final String query = "UPDATE auction_permission SET  product_id = :productId, user_id = :userId, status = :status WHERE id = :id ";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("id", auctionPermission.getId())
                    .addParameter("productId", auctionPermission.getProduct_id())
                    .addParameter("userId", auctionPermission.getUser_id())
                    .addParameter("status", auctionPermission.getStatus())
                    .executeUpdate();
        }
    }
    public static void delete(AuctionPermission auctionPermission)
    {
        final String query = "DELETE FROM auction_permission WHERE id = :id";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("id", auctionPermission.getId())
                    .executeUpdate();
        }
    }
}
