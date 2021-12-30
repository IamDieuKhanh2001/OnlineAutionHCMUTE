package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.EmailConfirm;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class EmailNotificationSellerModel {
    public static void add(int productID)
    {
        final String query = "INSERT INTO `email_notification_seller`(`product_id`) " +
                "VALUES(:productID)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("productID", productID)
                    .executeUpdate();
        }
    }

    public static boolean check(int productID)
    {
        final String query = "SELECT * FROM `email_notification_seller` WHERE `product_id` = :productID";
        try (Connection connection = DbUtils.getConnection())
        {
            List<EmailConfirm.EmailNotificationSeller> list = connection.createQuery(query)
                    .addParameter("productID", productID)
                    .executeAndFetch(EmailConfirm.EmailNotificationSeller.class);
            if(list.size() == 0)
                return false;
            return true;
        }
    }
}
