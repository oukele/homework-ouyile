package com.web;

import com.dao.iPhoneDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/IphoneDels")
public class IphoneDels extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String[] ids = id.split(",");
        for (String s : ids) {
            boolean flag = new iPhoneDao().delete(Integer.parseInt(s));
        }
        response.getWriter().print("{\"msg\":\"删除成功!\"}");
        //request.getRequestDispatcher("/IphoneList").forward(request,response);
    }
}
