package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.Product;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


public class ProductModel {
    public static List<Product> findAll()
    {
        final String query = "select * from products";
        try (Connection connection = DbUtils.getConnection())
        {
            List<Product> list = connection.createQuery(query)
                    .executeAndFetch(Product.class);
            return list;
        }
    }
    public static List<Product> findAllProductByProductTypeID(int productTypeID)
    {
        final String query = "SELECT * FROM `products` WHERE `product_type_id` = productTypeID";
        try (Connection connection = DbUtils.getConnection())
        {
            List<Product> list = connection.createQuery(query)
                    .addParameter("productTypeID", productTypeID)
                    .executeAndFetch(Product.class);
            return list;
        }
    }

    public static Product findProductByID(int productID)
    {
        final String query = "SELECT * FROM `products` WHERE `id` = :productID";
        try (Connection connection = DbUtils.getConnection())
        {
            List<Product> list = connection.createQuery(query)
                                .addParameter("productID", productID)
                                .executeAndFetch(Product.class);
            if(list.size() == 0)
                return null;
            return list.get(0);
        }
    }

    public static void add(Product product)
    {
        final String query = "INSERT INTO `products` (`name`, `description`, `product_type_id`, `user_id`, `price_start`, `price_step`, `price_current`, `price_buy_now`) " +
                "VALUES (:name, :description, :productTypeID, :userID, :priceStart, :priceStep, :priceCurrent, :priceBuyNow)";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("name", product.getName())
                    .addParameter("description", product.getDescription())
                    .addParameter("productTypeID", product.getProduct_type_id())
                    .addParameter("userID", product.getUser_id())
                    .addParameter("priceStart", product.getPrice_start())
                    .addParameter("priceStep", product.getPrice_step())
                    .addParameter("priceCurrent", product.getPrice_current())
                    .addParameter("priceBuyNow", product.getPrice_buy_now())
                    .executeUpdate();

        }
    }

    public static void update(Product product)
    {
        final String query = "UPDATE `products` SET " +
                "`name` = :newName, " +
                "`description` = :newDesc " +
                "`product_type_id` = :newProductTypeID " +
                "`user_id` = :newUserID " +
                "`price_start` = :newPriceStart " +
                "`price_step` = :newPriceStep " +
                "`price_current` = :newPriceCurrent " +
                "`price_buy_now` = :newPriceBuyNow " +
                "`modified_time` = :newUpdateTime " +
                "WHERE `id` = :productID";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("newName", product.getName())
                    .addParameter("newDesc", product.getDescription())
                    .addParameter("newProductTypeID", product.getProduct_type_id())
                    .addParameter("newUserID", product.getUser_id())
                    .addParameter("newPriceStart", product.getPrice_start())
                    .addParameter("newPriceStep", product.getPrice_step())
                    .addParameter("newPriceCurrent", product.getPrice_current())
                    .addParameter("newPriceBuyNow", product.getPrice_buy_now())
                    .addParameter("newUpdateTime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()))
                    .executeUpdate();
        }
    }

    public static void delete(int productID)
    {
        final String query = "DELETE FROM `products` WHERE `id` = :productID";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("productID", productID)
                    .executeUpdate();
        }
    }

    public static void deleteAllByProductTypeID (int productTypeID)
    {
        final String query = "DELETE FROM `products` WHERE `product_type_id` = :productTypeID";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("productTypeID", productTypeID)
                    .executeUpdate();
        }
    }

    public static void updateAllProductTypeID(int oldProductTypeID, int newProductTypeID)
    {
        final String query = "UPDATE `products` SET " +
                "`product_type_id` = :newProductTypeID " +
                "WHERE `product_type_id` = :oldProductTypeID";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("newProductTypeID", newProductTypeID)
                    .addParameter("oldProductTypeID", oldProductTypeID)
                    .executeUpdate();
        }

    }



}
