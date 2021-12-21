package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.AuctionPermission;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

public class AuctionPermissionModel {
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
}
