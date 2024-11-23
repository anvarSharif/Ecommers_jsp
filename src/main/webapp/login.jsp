<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 18/11/2024
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<div class="card container p-4 w-50 my-5">
    <h1 class="mx-5">Login</h1>
    <form action="/login" method="post">
        <div class="py-2 text-center">
            <input type="text" name="phone_inp" class="form-control w-75 mx-5" placeholder="phone">
        </div>
        <div class="py-md-2">
            <input type="password" name="password_inp" class="form-control w-75 mx-5" placeholder="password">
        </div>
        <button class="btn btn-outline-secondary w-25 mx-5">sign in</button>
    </form>
</div>
</body>
</html>
