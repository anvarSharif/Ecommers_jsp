<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.Category" %>
<%@ page import="lombok.Data" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.DB" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 21/11/2024
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Category</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<%
    String categoryId = request.getParameter("categoryId");
    Category category = null;
    if (categoryId != null) {
        category = DB.categories.stream().filter(item -> item.getId().equals(Integer.parseInt(categoryId))).findFirst().get();
    }
%>
<div class="container mt-5">
    <div class="card">
        <div class="card-body">
            <h3 class="card-title text-center mb-4">Category <%=category == null ? "add" : "update"%>
            </h3>
            <form action="/category/add" method="post">
                <input type="hidden" name="categoryId" value="<%=categoryId%>">
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Category nomini kiriting"
                           value="<%=category==null?"":category.getName()%>" required>
                </div>
                <div class="text-end">
                    <button type="submit" class="btn btn-dark"><%=categoryId == null ? "Add" : "Update"%>Category
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>


</body>
</html>
