package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.Product;
import com.ute.onlineautionhcmute.beans.ProductBiddingCount;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class ProductBiddingCountModel {
    public static List<ProductBiddingCount> findProductBiddingCount()
    {
        final String query = "select  id,product_id,price_bidding,user_id_holding,create_time,count(*) as quantity from product_history group by product_id";
        try (Connection connection = DbUtils.getConnection())
        {
            List<ProductBiddingCount> list = connection.createQuery(query)
                    .executeAndFetch(ProductBiddingCount.class);
            return list;
        }
    }
}
