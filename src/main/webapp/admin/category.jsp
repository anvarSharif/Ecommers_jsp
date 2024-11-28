<%@ page import="uz.pdp.homework_4jspinternetmagazin.DB" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<%
    List<Category> categories = DB.categories;
%>

<div class="container m-2">
    <div class="row">
        <div class="col-3 card">
            <div class="list-group">
                <a href="/admin/category.jsp" class="btn btn-dark mb-2">Category</a>
                <a href="/admin/product.jsp" class="btn btn-dark mb-2">Product</a>
            </div>
        </div>
        <div class="col-9 card">
            <form action="/auth/logout" method="post">
                <button class="btn btn-dark">
                    Logout
                </button>
            </form>
            <div class="d-flex justify-content-between mb-3">
                <h2>Category List</h2>
                <form action="/admin/addCategory.jsp">
                    <button class="btn btn-success">Add Category</button>
                </form>
            </div>
            <table class="table table-striped">
                <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <% for (Category category : categories) { %>
                <tr>
                    <td><%= category.getId() %></td>
                    <td><%= category.getName() %></td>
                    <td>
                        <div class="d-flex">
                            <form action="/category/delete" method="post" class="mr-2">
                                <input type="hidden" name="categoryId" value="<%= category.getId() %>">
                                <button class="btn btn-danger">Delete</button>
                            </form>
                            <form action="addCategory.jsp" method="get">
                                <input type="hidden" name="categoryId" value="<%= category.getId() %>">
                                <button class="btn btn-dark">Update</button>
                            </form>
                        </div>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
