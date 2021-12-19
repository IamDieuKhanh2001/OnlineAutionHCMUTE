package com.ute.onlineautionhcmute.models;


import com.ute.onlineautionhcmute.beans.Product;
import com.ute.onlineautionhcmute.beans.Winner;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class WinnerModel {
    public static List<Winner> findAll()
    {
        final String query = "SELECT * FROM `winner`";
        try (Connection connection = DbUtils.getConnection())
        {
            return connection.createQuery(query).executeAndFetch(Winner.class);
        }
    }

    public static List<Winner> findByUserID(int userID)
    {
        final String query = "SELECT * FROM `winner` where `user_id` = :userID";
        try (Connection connection = DbUtils.getConnection())
        {
            List<Winner> list = connection.createQuery(query)
                    .addParameter("userID", userID)
                    .executeAndFetch(Winner.class);
            return list;
        }
    }

    public static Winner findByProductID(int proID)
    {
        final String query = "SELECT * FROM `winner` where `product_id` = :proID";
        try (Connection connection = DbUtils.getConnection())
        {
            List<Winner> list = connection.createQuery(query)
                    .addParameter("proID", proID)
                    .executeAndFetch(Winner.class);
            if(list.size() == 0){
                return null;
            }
            return list.get(0);
        }
    }

    public static void add(Winner winner)
    {
        final String query = "INSERT INTO winner (user_id, product_id) VALUES (:userId,:productId)";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("userId", winner.getUser_id())
                    .addParameter("productId", winner.getProduct_id())
                    .executeUpdate();
        }
    }
}
