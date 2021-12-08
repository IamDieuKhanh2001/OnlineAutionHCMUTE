package com.ute.onlineautionhcmute.filters;

import com.ute.onlineautionhcmute.beans.Category;
import com.ute.onlineautionhcmute.beans.ProductType;
import com.ute.onlineautionhcmute.models.CategoryModel;
import com.ute.onlineautionhcmute.models.ProductTypeModel;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebFilter(filterName = "LayoutFilter")
public class LayoutFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        // Phan get du lieu partials left
        List<Category> categories = CategoryModel.findAll();
        List<ProductType> listProductType = new ArrayList<ProductType>();
        categories.forEach((category -> {
            List<ProductType> list = ProductTypeModel.findProductTypeWithCategoryID(category.getId());
            list.forEach((productType -> {
                listProductType.add(productType);
            }));
            listProductType.add(null);
        }));
        request.setAttribute("categoriesWithDetails", categories);
        request.setAttribute("listProductTypeWithDetails", listProductType);
        // End phan get du lieu partials left

        chain.doFilter(request, response);
    }
}
