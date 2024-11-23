<%@ page import="uz.pdp.homework_4jspinternetmagazin.DB" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.Order" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.OrderItem" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.Product" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 20/11/2024
  Time: 18:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orders</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">

</head>
<body>
<div class="card m-2 ">
    <%
        List<Order> orders = new ArrayList<>();
        Optional<Cookie> optionalCookie = Arrays.stream(request.getCookies()).filter(item -> item.getName().equals("userId")).findFirst();
        if (optionalCookie.isPresent()) {
            Integer userId = Integer.parseInt(optionalCookie.get().getValue());
            orders = DB.orders.stream().filter(item -> item.getUserId().equals(userId)).toList();
        }
    %>
    <a href="/product.jsp" class="btn btn-dark w-25">
        <- back
    </a>
    <h1>Orders</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Order ID</th>
            <th>Date Time</th>
            <th>Status</th>
            <th>UserId</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% for (Order order : orders) { %>
        <tr>
            <td><%= order.getId() %></td>
            <td><%= order.getDateTime() %></td>
            <td><%= order.getStatus() %></td>
            <td><%= order.getUserId() %></td>
            <td>
                <form action="/OrderItems.jsp" method="get">
                    <input type="hidden" name="orderId" value="<%= order.getId() %>">
                    <button class="btn btn-dark">
                        Show
                    </button>
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>

</div>
</body>
</html>
