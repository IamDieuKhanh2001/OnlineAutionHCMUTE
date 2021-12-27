package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.Product;

import com.ute.onlineautionhcmute.beans.ProductBiddingCount2;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class ProductBiddingCount2Model {
    public static List<ProductBiddingCount2> findTop5ProductBidding()
    {
        final String query = "select products.id as id,name,description,product_type_id,user_id,price_start,price_step,price_current,price_buy_now,end_time,user_id_holding_price,products.create_time as create_time,modified_time,count(*) as quantity from product_history,products where product_history.product_id = products.id group by  product_id order by quantity desc limit 5";
        try (Connection connection = DbUtils.getConnection())
        {
            List<ProductBiddingCount2> list = connection.createQuery(query)
                    .executeAndFetch(ProductBiddingCount2.class);
            return list;
        }
    }
}
