package com.ute.onlineautionhcmute.models;
import com.ute.onlineautionhcmute.beans.Category;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class CategoryModel {
    public static List<Category> findAll()
    {
        final String query = "SELECT * FROM `categories`";
        try(Connection connection = DbUtils.getConnection())
        {
            return connection.createQuery(query).executeAndFetch(Category.class);
        }
    }
    public static Category findById(int id) {
        final String query = "select * from categories where id = :id";
        try (Connection con = DbUtils.getConnection()) {
            List<Category> list = con.createQuery(query)
                    .addParameter("id", id)
                    .executeAndFetch(Category.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }
    public static void add(Category c) {
        String insertSql = "INSERT INTO categories (name, create_time, modified_time) VALUES (:name,:createTime,:modifiedTime)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("name", c.getName())
                    .addParameter("createTime", c.getCreate_time())
                    .addParameter("modifiedTime", c.getModified_time())
                    .executeUpdate();
        }
    }
    public static void delete(int id) {
        String sql = "delete from categories where id = :id";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("id", id)
                    .executeUpdate();
        }
    }
    public static void update(Category c) {
        String sql = "UPDATE categories SET  name = :name, create_time = :createTime, modified_time = :modifiedTime WHERE id = :id";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("id", c.getId())
                    .addParameter("name", c.getName())
                    .addParameter("createTime", c.getCreate_time())
                    .addParameter("modifiedTime", c.getModified_time())
                    .executeUpdate();
        }
    }
}
