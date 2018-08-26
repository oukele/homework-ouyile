package com.web;

import com.dao.iPhoneDao;
import com.entity.iPhone;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/IphoneUpdate")
public class IphoneUpdate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        String color = request.getParameter("color");
        String memory = request.getParameter("memory");
        boolean flag = new iPhoneDao().update(new iPhone(id,name,price,color,memory));
        if(flag){
            response.getWriter().print("{\"msg\":\"更新成功!\"}");
        }else {
            response.getWriter().print("{\"msg\":\"更新失败!\"}");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        iPhone info = new iPhoneDao().getInfo(id);
        if(info!=null){
            String s = new Gson().toJson(info);
            response.getWriter().print(s);

        }
    }
}
