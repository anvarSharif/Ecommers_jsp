<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<div class="card container p-4 w-50 my-5">
    <h1 class="mx-5">Register</h1>
    <form action="/register" method="post" enctype="multipart/form-data">
        <div class="py-2 text-center">
            <input type="file" class="form-control w-75 mx-5" name="userPhoto" required>
        </div>
        <div class="py-2 text-center">
            <input type="text" name="phone_inp" class="form-control w-75 mx-5" placeholder="Phone" required>
        </div>
        <div class="py-2 text-center">
            <input type="password" name="password_inp" class="form-control w-75 mx-5" placeholder="Password" required>
        </div>
        <div class="py-2 text-center">
            <input type="password" name="password_repeat_inp" class="form-control w-75 mx-5"
                   placeholder="Confirm Password" required>
        </div>

        <button class="btn btn-outline-secondary w-25 mx-5">Sign Up</button>
    </form>
</div>
</body>
</html>
