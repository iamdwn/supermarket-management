<%-- 
    Document   : item
    Created on : Jun 7, 2023, 7:52:29 AM
    Author     : truon
--%>

<%@page import="java.util.List"%>
<%@page import="entities.supermarket"%>
<%@page import="entities.supermarket"%>
<%@page import="dao.supermarketDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item</title>
        <style>
            table, th, td {
                border: 1px solid black;
            }
            th, td {
                padding: 10px;
            }
        </style>
    </head>
    <body>

        <table>
            <thead>
            <th>id</th>
            <th>name</th> 
            <th>price</th>
            <th>type</th> 
            <th></th> 
            <th><input type="submit" value="Back" onclick="back()"></th>
                <%
                    String item_type = (String) session.getAttribute("i_type");
                    String type_name = (String) session.getAttribute("type_name");
                    out.print(type_name);
                    supermarketDAO spd = new supermarketDAO();
                    List<supermarket> list = spd.getListSupermarket(item_type);
                    for (supermarket sp : list) {
                %>
            <tbody>
            <td id="id" name="id"><%=sp.getId()%></td>
            <td id="name" name="name"><%=sp.getName()%></td>
            <td id="price" name="price"><%=sp.getPrice()%></td>
            <td id="type" name="type"><%=sp.getType()%></td>
            <td><a href="MainController?action=Edit&type=<%=sp.getType()%>&id=<%=sp.getId()%>">Edit</a></td>
            <td><a href="MainController?action=Delete&type=<%=sp.getType()%>&id=<%=sp.getId()%>">Delete</a></td>
        </tbody>
        <%
            }
        %> 
        <script>
            function back() {
                location.assign("index.jsp");
            }
        </script>
    </table>
</body>
</html>
