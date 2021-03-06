package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.Product;
import com.ute.onlineautionhcmute.beans.ProductType;
import com.ute.onlineautionhcmute.beans.User;
import com.ute.onlineautionhcmute.beans.WatchList;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class WatchListModel {
    public static List<WatchList> findAll()
    {
        final String query = "SELECT * FROM watch_list";
        try (Connection connection = DbUtils.getConnection())
        {
            return connection.createQuery(query).executeAndFetch(WatchList.class);
        }
    }

    public static WatchList findByProIdAndUserId(int productId, int userId) {
        final String query = "select * from watch_list where product_id = :id and user_id = :userId";
        try (Connection con = DbUtils.getConnection()) {
            List<WatchList> list = con.createQuery(query)
                    .addParameter("id", productId)
                    .addParameter("userId", userId)
                    .executeAndFetch(WatchList.class);
            if (list.size() == 0) {
                return null;
            }
            return  list.get(0);
        }
    }

    public static List<WatchList> findByUserID(int id)
    {
        final String query = "select * from watch_list where user_id = :id";
        try (Connection connection = DbUtils.getConnection())
        {
            List<WatchList> list = connection.createQuery(query)
                    .addParameter("id", id)
                    .executeAndFetch(WatchList.class);

            return list;
        }
    }
    public static void add(Product product, User bidder)
    {
        final String query = "INSERT INTO watch_list (user_id, product_id) VALUES (:userId,:productId)";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("userId", bidder.getId())
                    .addParameter("productId", product.getId())
                    .executeUpdate();

        }
    }
    public static void delete(int productID, int userID)
    {
        final String query = "DELETE FROM watch_list WHERE watch_list.product_id = :productID and watch_list.user_id = :userID";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("productID", productID)
                    .addParameter("userID", userID)
                    .executeUpdate();
        }
    }
}
