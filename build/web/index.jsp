<%-- 
    Document   : index
    Created on : Jun 25, 2023, 1:37:22 AM
    Author     : truon
--%>

<%@page import="entities.type"%>
<%@page import="controller.LoadTypeServlet"%>
<%@page import="java.util.List"%>
<%@page import="dao.supermarketDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Type</title>
    </head>
    <%
        List<type> typelist = (List<type>) session.getAttribute("typelist");
        for (type sp : typelist){
    %>
    <tbody>
    <a href="LoadItemServlet?name=<%=sp.getName()%>&item_type=<%=sp.getId()%>" id="type" name="type"><%=sp.getName()%><a>&nbsp&nbsp&nbsp&nbsp</a>
    </tbody>
    <%
        }
    %> 
</html>
