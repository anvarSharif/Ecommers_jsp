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
        List<Order> orders=new ArrayList<>();
        Integer sum=0;
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
    <p>==============================</p>
    <%for (Order order : orders) {%>
    <%
            List<OrderItem> orderItems = DB.orderItems.stream().filter(item -> item.getOrderId().equals(order.getId())).toList();
        for (OrderItem orderItem : orderItems) {
                    Product product = DB.products.stream().filter(item -> item.getId().equals(orderItem.getProductId())).findFirst().get();
    %>
    <p>               product name: <%=product.getName()%> ------ total: <%=orderItem.getAmount()%></p>

    <%sum+=product.getPrice()*orderItem.getAmount();
        }%>
    <p>user's id:  <%=order.getUserId()%>
    </p>
    <p> date_time:  <%=order.getDateTime()%>
    <p> Total summa:  <%=sum%>
    </p>
    <br>
    <p>==============================</p>
    <%}%>
</div>
</body>
</html>
