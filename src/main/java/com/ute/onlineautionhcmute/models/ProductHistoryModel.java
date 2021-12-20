package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.Product;
import com.ute.onlineautionhcmute.beans.ProductHistory;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class ProductHistoryModel {
    public static void add(ProductHistory productHistory)
    {
        final String query = "INSERT INTO product_history (product_id, price_bidding, user_id_holding) VALUES (:productId,:priceBidding,:userIdHolding)";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("productId", productHistory.getProduct_id())
                    .addParameter("priceBidding", productHistory.getPrice_bidding())
                    .addParameter("userIdHolding", productHistory.getUser_id_holding())
                    .executeUpdate();
        }
    }

    public static List<ProductHistory> findByProductID(int productID)
    {
        final String query = "SELECT * FROM product_history WHERE product_id = :productID";
        try (Connection connection = DbUtils.getConnection())
        {
            List<ProductHistory> list = connection.createQuery(query)
                    .addParameter("productID", productID)
                    .executeAndFetch(ProductHistory.class);
            return list;
        }
    }
}
