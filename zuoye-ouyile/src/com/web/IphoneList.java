package com.web;

import com.dao.iPhoneDao;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/IphoneList")
public class IphoneList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("utf-8");
//        response.setContentType("application/json;charset=utf-8");
//        response.setCharacterEncoding("utf-8");
        String search =request.getParameter("value");
        if(search!=null || search!=""){
            String s = new Gson().toJson(new iPhoneDao().getSearch(search));
            response.getWriter().print(s);
        }else {
            String s = new Gson().toJson(new iPhoneDao().ListAll());
            response.getWriter().print(s);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
