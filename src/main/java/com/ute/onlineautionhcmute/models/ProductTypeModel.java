package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.ProductType;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class ProductTypeModel {

    public static List<ProductType> findProductTypeWithCategoryID(int categoryID)
    {
        final String query = "SELECT * FROM `product_type` WHERE `category_id` = :categoryID";
        try (Connection connection = DbUtils.getConnection())
        {
            List<ProductType> list = connection.createQuery(query)
                    .addParameter("categoryID", categoryID)
                    .executeAndFetch(ProductType.class);

            return list;
        }
    }
    public static ProductType findById(int id) {
        final String query = "SELECT `id`, `name`, `category_id`, `create_time`, `modified_time` FROM `product_type` WHERE `id` = :id";
        try (Connection con = DbUtils.getConnection()) {
            List<ProductType> list = con.createQuery(query)
                    .addParameter("id", id)
                    .executeAndFetch(ProductType.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }
    public static List<ProductType> findAll()
    {
        final String query = "SELECT * FROM `product_type`";
        try (Connection connection = DbUtils.getConnection())
        {
            return connection.createQuery(query).executeAndFetch(ProductType.class);
        }
    }

    public static void add(ProductType p) {
        String insertSql = "INSERT INTO `product_type` (`name`, `category_id`) VALUES (:name, :categoryID)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("name", p.getName())
                    .addParameter("categoryID", p.getCategory_id())
                    .executeUpdate();
        }
    }

    public static void delete(int id) {
        String sql = "DELETE FROM `product_type` where id = :id";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("id", id)
                    .executeUpdate();
        }
    }

    public static void deleteAllByCategoryID (int categoryID)
    {
        final String query = "DELETE FROM `product_type` WHERE `category_id` = :categoryID";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("categoryID", categoryID)
                    .executeUpdate();
        }
    }

    public static void update(ProductType p) {
        String sql = "UPDATE `product_type` SET  `name` = :name, `category_id` = :categoryId, `modified_time` = :modifiedTime WHERE `id` = :id";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("id", p.getId())
                    .addParameter("name", p.getName())
                    .addParameter("categoryId", p.getCategory_id())
                    .addParameter("modifiedTime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()))
                    .executeUpdate();
        }
    }

    public static void updateAllCategoryID(int oldCategoryID, int newCategoryID)
    {
        final String query = "UPDATE `product_type` SET " +
                "`category_id` = :newCategoryID " +
                "WHERE `category_id` = :oldCategoryID";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("newCategoryID", newCategoryID)
                    .addParameter("oldCategoryID", oldCategoryID)
                    .executeUpdate();
        }
    }
}
