package com.ute.onlineautionhcmute.filters;

import com.ute.onlineautionhcmute.models.UserModel;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "TmpFilter", value = "/*")
public class TmpFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request1 = (HttpServletRequest)request;
        HttpSession session = request1.getSession();
        session.setAttribute("auth1",true);
        session.setAttribute("authUser1", UserModel.findById(5));
        chain.doFilter(request, response);
    }
}
