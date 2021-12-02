package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.Product;
import com.ute.onlineautionhcmute.beans.UserType;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class UserTypeModel {
    public static List<UserType> findAll()
    {
        final String query = "SELECT * FROM `user_type`";
        try (Connection connection = DbUtils.getConnection())
        {
            List<UserType> list = connection.createQuery(query)
                    .executeAndFetch(UserType.class);
            return list;
        }
    }
}
