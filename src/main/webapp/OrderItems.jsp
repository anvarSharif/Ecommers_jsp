<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.OrderItem" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.DB" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.Product" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.Order" %>
<%@ page import="java.util.Optional" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 23/11/2024
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>OrderItem</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body><div class="container my-4">
    <div class="card">
        <a href="/order.jsp" class="btn btn-dark w-25">
            <- back
        </a>
        <div class="card-header text-center">
            <h4>Order Receipt</h4>
        </div>
        <div class="card-body">
            <%
                Integer sum = 0;
                int orderId = Integer.parseInt(request.getParameter("orderId"));
                Optional<Order> optionalOrder = DB.orders.stream().filter(order -> order.getId().equals(orderId)).findFirst();
                if (optionalOrder.isPresent()) {
                    Order order = optionalOrder.get();
                    List<OrderItem> orderItems = DB.orderItems.stream().filter(item -> item.getOrderId().equals(order.getId())).toList();
            %>
            <div class="mb-3">
                <strong>Order ID:</strong> <%= order.getId() %><br>
                <strong>Date & Time:</strong> <%= order.getDateTime() %><br>
                <strong>User ID:</strong> <%= order.getUserId() %>
            </div>
            <hr>
            <div class="mb-3">
                <% for (OrderItem orderItem : orderItems) {
                    Product product = DB.products.stream().filter(item -> item.getId().equals(orderItem.getProductId())).findFirst().get();
                    int total = product.getPrice() * orderItem.getAmount();
                    sum += total;
                %>
                <div class="d-flex justify-content-between">
                    <span><%= product.getName() %> x <%= orderItem.getAmount() %></span>
                    <span><%= total %> UZS</span>
                </div>
                <% } %>
            </div>
            <hr>
            <div class="text-center">
                <strong>Total Summa:</strong> <%= sum %> UZS
            </div>
            <% } else { %>
            <p>Order not found.</p>
            <% } %>
        </div>
    </div>
</div></body>
</html>
