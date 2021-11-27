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
}
