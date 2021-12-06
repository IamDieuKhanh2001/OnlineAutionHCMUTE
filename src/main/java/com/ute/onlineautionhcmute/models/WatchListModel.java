package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.Product;
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

    public static WatchList findByProID(int id) {
        final String query = "select * from watch_list where product_id = :id";
        try (Connection con = DbUtils.getConnection()) {
            List<WatchList> list = con.createQuery(query)
                    .addParameter("id", id)
                    .executeAndFetch(WatchList.class);
            if (list.size() == 0) {
                return null;
            }
            return  list.get(0);
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

}
