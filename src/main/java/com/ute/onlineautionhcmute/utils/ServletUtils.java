package com.ute.onlineautionhcmute.utils;

import com.ute.onlineautionhcmute.beans.User;
import com.ute.onlineautionhcmute.models.UserModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ServletUtils {
    public static void forward(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request,response);
    }
    public static void redirect(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String contextPath = request.getContextPath();
        int idx = url.indexOf(contextPath);
        if(idx < 0){
            response.sendRedirect(request.getContextPath() + url);
        }else{
            response.sendRedirect(url);
        }
    }
    public static void updateUserSession(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("authUser");
        User userUpdated = UserModel.findById(user.getId());
        session.setAttribute("authUser", userUpdated);
    }
}
