package com.web;

import com.dao.iPhoneDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/IphoneDel")
public class IphoneDel extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean flag = new iPhoneDao().delete(id);
        if(flag){
             response.getWriter().print("{\"msg\":\"删除成功!\"}");
        }else {
            response.getWriter().print("{\"msg\":\"删除失败！\"}");
        }
    }

}
