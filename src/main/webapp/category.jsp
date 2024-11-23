<%@ page import="uz.pdp.homework_4jspinternetmagazin.DB" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.Category" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 18/11/2024
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-3 vh-100 p-3 card">
            <div class="list-group">
                <form action="/order.jsp">
                    <button class="btn btn-secondary w-100 my-1">
                        Orders
                    </button>
                </form>
                <form action="/category.jsp">
                    <button class="btn btn-secondary w-100 my-1">
                        Category
                    </button>
                </form>
                <form action="/product.jsp">
                    <button class="btn btn-secondary w-100 my-1">
                        Product
                    </button>
                </form>
            </div>
        </div>

        <div class="col-9 p-4 card">
            <h3 class="mb-4">Mahsulotlar</h3>
            <form action="addCategory.jsp">
                <button class="btn btn-dark w-25">
                    Add Category
                </button>
            </form>

            <% for (Category category : DB.categories) { %>
            <input type="hidden" name="categoryId" value=<%=category.getId()%>>
            <button class="btn btn-secondary w-100 my-1">
                <%= category.getName() %>
            </button>
            <% } %>
        </div>
    </div>
</div>

</body>
</html>
