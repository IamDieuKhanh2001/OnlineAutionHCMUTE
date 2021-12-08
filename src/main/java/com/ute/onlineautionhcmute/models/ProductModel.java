package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.Category;
import com.ute.onlineautionhcmute.beans.Product;
import com.ute.onlineautionhcmute.beans.User;
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
    public static Product findById(int id) {
        final String query = "select * from products where id = :id";
        try (Connection con = DbUtils.getConnection()) {
            List<Product> list = con.createQuery(query)
                    .addParameter("id", id)
                    .executeAndFetch(Product.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }

    public static List<Product> findAllProductByProductTypeID(int productTypeID)
    {
        final String query = "SELECT * FROM `products` WHERE `product_type_id` = :productTypeID";
        try (Connection connection = DbUtils.getConnection())
        {
            List<Product> list = connection.createQuery(query)
                    .addParameter("productTypeID", productTypeID)
                    .executeAndFetch(Product.class);
            return list;
        }
    }
    public static List<Product> findByUserID(int userID)
    {
        final String query = "SELECT * FROM `products` WHERE `user_id` = :userID";
        try (Connection connection = DbUtils.getConnection())
        {
            List<Product> list = connection.createQuery(query)
                    .addParameter("userID", userID)
                    .executeAndFetch(Product.class);
            return list;
        }
    }

    public static Product findInsertRecentByUserID(int userID) {
        final String query = "SELECT * from products where id = (SELECT MAX( id ) FROM products where user_id = :userID)";
        try (Connection con = DbUtils.getConnection()) {
            List<Product> list = con.createQuery(query)
                    .addParameter("userID", userID)
                    .executeAndFetch(Product.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
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
        final String query = "UPDATE products SET  name = :name, price_buy_now = :priceBuyNow, modified_time = :modifiedTime, description = :description, product_type_id = :productTypeId, user_id = :userId, price_start = :priceStart, price_step = :priceStep, price_current = :priceCurrent WHERE id = :id";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("id", product.getId())
                    .addParameter("name", product.getName())
                    .addParameter("description", product.getDescription())
                    .addParameter("productTypeId", product.getProduct_type_id())
                    .addParameter("userId", product.getUser_id())
                    .addParameter("priceStart", product.getPrice_start())
                    .addParameter("priceStep", product.getPrice_step())
                    .addParameter("priceCurrent", product.getPrice_current())
                    .addParameter("priceBuyNow", product.getPrice_buy_now())
                    .addParameter("modifiedTime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()))
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
        final String query = "UPDATE `products` SET `product_type_id` = :newProductTypeID WHERE `product_type_id` = :oldProductTypeID";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("newProductTypeID", newProductTypeID)
                    .addParameter("oldProductTypeID", oldProductTypeID)
                    .executeUpdate();
        }

    }



}
