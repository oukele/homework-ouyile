package com.web;

import com.dao.iPhoneDao;
import com.entity.iPhone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/IphoneAdd")
public class IponeAdd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        String color = request.getParameter("color");
        String memory = request.getParameter("memory");
        boolean flag = new iPhoneDao().add(new iPhone(id,name,price,color,memory));
        if(flag){
            response.getWriter().print("{\"msg\":\"添加成功!\"}");
        }else {
            response.getWriter().print("{\"msg\":\"添加失败!\"}");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
