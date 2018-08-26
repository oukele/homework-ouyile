    <%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>

        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%--加载被修饰页面的标题--%>
        <title><sitemesh:title /></title>
        <%--加载css文件--%>
        <%@include file="iphone_css.jsp"%>
        <%--加载被修饰页面头部的信息--%>
        <sitemesh:head/>
    </head>
    <body>

        <div id="wrapper">
            <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html">小小手机管理系统</a>
                </div>

                <div class="header-right">

                    <%--<a href="message-task.html" class="btn btn-info" title="New Message"><b>30 </b><i class="fa fa-envelope-o fa-2x"></i></a>--%>
                    <%--<a href="message-task.html" class="btn btn-primary" title="New Task"><b>40 </b><i class="fa fa-bars fa-2x"></i></a>--%>
                    <a href="login.html" class="btn btn-danger" title="Logout">注销<i class="fa fa-exclamation-circle fa-2x"></i></a>

                </div>
            </nav>

            <!-- /. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav" id="main-menu">
                        <%--头像--%>
                        <li>
                            <div class="user-img-div">
                                <img src="https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=64146632,1808806096&fm=27&gp=0.jpg" class="img-thumbnail" />

                                <div class="inner-text">
                                    <%--Jhon Deo Alex--%>
                                    <br />
                                    <small><!--Last Login : 2 Weeks Ago--> 当前登录账号:<span style="color: rebeccapurple"><%=request.getSession().getAttribute("user")!=null?request.getSession().getAttribute("user"):"未登录"%></span> </small>
                                </div>
                            </div>

                        </li>

                        <%--菜单功能--%>
                        <li>
                             <a class="active-menu" href="/jsp/IphoneList.jsp"><i class="fa fa-dashboard "></i>手机信息</a>
                             <a class="active-menu" href="/jsp/IphoneList.jsp"><i class="fa fa-dashboard "></i>数据导出</a>
                             <a class="active-menu" href="/jsp/IphoneList.jsp"><i class="fa fa-dashboard "></i>订单信息</a>
                             <a class="active-menu" href="/jsp/IphoneList.jsp"><i class="fa fa-dashboard "></i>库存信息</a>
                             <a class="active-menu" href="/jsp/IphoneList.jsp"><i class="fa fa-dashboard "></i>系统设置</a>
                        </li>
                    </ul>

                 </div>

            </nav>
            <!-- /. NAV SIDE  -->
            <%--脚本--%>
            <%@include file="iphone_js.jsp"%>

            <%--内容区--%>
            <div id="page-wrapper">
                <div id="page-inner">
                     <%--<div style="border: 1px solid red;width:auto;height: 400px"></div>--%>
                    <sitemesh:body></sitemesh:body>
                </div>
            </div>

        </div>

    </body>
</html>
