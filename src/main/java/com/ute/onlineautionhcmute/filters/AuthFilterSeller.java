package com.ute.onlineautionhcmute.filters;

import com.ute.onlineautionhcmute.beans.User;
import com.ute.onlineautionhcmute.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AuthFilterSeller")
public class AuthFilterSeller implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;

        HttpSession session = request.getSession();
        boolean auth = (boolean) session.getAttribute("auth");
        User authUser = (User) session.getAttribute("authUser");
        if (!auth) {
            session.setAttribute("retUrl", request.getRequestURI());
            ServletUtils.redirect("/Account/Login", request, (HttpServletResponse) res);
            return;
        }
        else {
            if (authUser.getUser_type_id() != 2) {
                ServletUtils.forward("/views/404.jsp", request, (HttpServletResponse) res);
                return;
            }
        }
        chain.doFilter(req, res); // cho phép request tiếp tục thực hiện
    }
}
