<%-- 
    Document   : editpage
    Created on : Jun 25, 2023, 10:54:46 AM
    Author     : truon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
    </head>
    <style>
        .thongbao{
            color: red;
        }
    </style>
    <body>
        <form action="EditServlet">
            id<input type="text" name="id" value="${item_id}" readonly=""></br>
            name<input type="text" name="name" required=""> <input type="submit" value="Save"></br>
            price<input type="number" name="price" min="0" required=""></br>
            type<input type="text" name="type" value="${item_type}" readonly="">
        </form>
        <div class="thongbao">
        <%
            Object alert = request.getAttribute("edit_alert");
            if (alert == null) {
                out.print("");
            } else {
                out.print(alert);
            }
        %>
        </div>
    </body>
</html>
