package com.ute.onlineautionhcmute.models;


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
}
