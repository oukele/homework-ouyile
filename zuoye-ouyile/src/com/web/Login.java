package com.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Login")
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("user");
        String pwd = request.getParameter("pwd");

        if(name!=""&&pwd!=""){
            request.getSession().setAttribute("user",name);
            //response.sendRedirect("jsp/IphoneList.jsp");
            response.getWriter().print("{\"msg\":\"成功\"}");
        }else{
            //response.sendRedirect("/html/login.html");
            response.getWriter().print("{\"msg\":\"失败\"}");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
