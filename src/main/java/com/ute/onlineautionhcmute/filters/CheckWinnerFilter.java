package com.ute.onlineautionhcmute.filters;

import com.ute.onlineautionhcmute.beans.Product;
import com.ute.onlineautionhcmute.beans.Winner;
import com.ute.onlineautionhcmute.models.ProductModel;
import com.ute.onlineautionhcmute.models.WinnerModel;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebFilter(filterName = "CheckWinnerFilter")
public class CheckWinnerFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        List<Product> products = ProductModel.findAll();
        for (Product item : products){
            if(item.getEnd_time().after(new Date()) == false && item.getUser_id_holding_price() != 0 && WinnerModel.findByProductID(item.getId()) == null){
                Winner winner = new Winner(-1, item.getUser_id_holding_price(),item.getId());
                WinnerModel.add(winner);
            }
        }

        chain.doFilter(request, response);
    }
}
