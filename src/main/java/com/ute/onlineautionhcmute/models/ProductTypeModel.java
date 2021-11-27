package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.Category;
import com.ute.onlineautionhcmute.beans.ProductType;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

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

    public static void update(ProductType p) {
        String sql = "UPDATE `product_type` SET  `name` = :name, `categoryID` = :categoryID, `modified_time` = :modifiedTime WHERE id = :id";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("id", p.getId())
                    .addParameter("categoryID", p.getCategory_id())
                    .addParameter("name", p.getName())
                    .addParameter("modifiedTime", new Date())
                    .executeUpdate();
        }
    }
}
