<%--
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
<body>

<div class="container mt-5">
    <div class="card">
        <div class="card-body">
            <h3 class="card-title text-center mb-4">Category qo'shish</h3>
            <form action="/category/add" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Category nomini kiriting" required>
                </div>

                <div class="text-end">
                    <button type="submit" class="btn btn-dark">Add Category</button>
                </div>
            </form>
        </div>
    </div>
</div>


</body>
</html>
