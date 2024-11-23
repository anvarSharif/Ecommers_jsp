<%@ page import="uz.pdp.homework_4jspinternetmagazin.DB" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.Category" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 21/11/2024
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add product</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <div class="card">
        <div class="card-body">
            <h3 class="card-title text-center mb-4">Mahsulot qo'shish</h3>
            <form action="/product/add" method="post" enctype="multipart/form-data">

                <div class="mb-3">
                    <label for="name1" class="form-label">Image</label>
                    <input type="file" class="form-control" id="name1" name="productImage" required>
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Mahsulot nomini kiriting" required>
                </div>

                <div class="mb-3">
                    <label for="price" class="form-label">Price</label>
                    <input type="number" class="form-control" id="price" name="price" placeholder="Narxini kiriting" min="1" required>
                </div>

                <!-- Kategoriya tanlash -->
                <div class="mb-3">
                    <label for="category" class="form-label">Kategoriya</label>
                    <select class="form-select" id="category" name="categoryId" required>
                        <option value="" disabled selected>Kategoriyani tanlang</option>
                        <% for (Category category : DB.categories) { %>
                        <option value="<%= category.getId() %>"><%= category.getName() %></option>
                        <% } %>
                    </select>
                </div>
                <div class="text-end">
                    <button type="submit" class="btn btn-dark">Add Product</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
