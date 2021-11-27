package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.ProductType;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

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

}
