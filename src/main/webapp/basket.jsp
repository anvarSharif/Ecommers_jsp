<%@ page import="uz.pdp.homework_4jspinternetmagazin.DB" %>
<%@ page import="java.util.Map" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.Product" %>
<%@ page import="java.util.Optional" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.Basket" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 18/11/2024
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Savatcha</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="card m-2">
        <div class="row">
            <%
                Basket basket = (Basket) Objects.requireNonNullElse(session.getAttribute("basket"), new Basket());
                Integer sum = 0;
                for (Map.Entry<Product, Integer> entry : basket.getMap().entrySet()) {
                    Product product = entry.getKey();
                    Integer amount = entry.getValue();
            %>
            <div class="col-3">
                <img src="/file/<%= product.getId() %>" class="card-img-top" alt="rasm topilmadi!"
                     style="height: 200px; object-fit: cover;">
            </div>

            <div class="col-7 offset-2 d-flex flex-column justify-content-center">
                <h2><%= product.getName() %></h2>
                <p>Narxi: <strong><%= product.getPrice() %> UZS</strong></p>
                <h4><%= product.getName() %> * <%= amount %> = <%= amount * product.getPrice() %> UZS</h4>

                <div class="d-flex align-items-center">
                    <form action="/basket" method="post" class="me-2">
                        <input type="hidden" name="operator" value="minus">
                        <input type="hidden" name="productId" value="<%= product.getId() %>">
                        <button class="btn btn-dark">-</button>
                    </form>
                    <span class="fs-5 mx-3"><%= amount %></span>
                    <form action="/basket" method="post" class="ms-2">
                        <input type="hidden" name="operator" value="plus">
                        <input type="hidden" name="productId" value="<%= product.getId() %>">
                        <button class="btn btn-dark">+</button>
                    </form>
                </div>
            </div>

            <div class="w-100 my-3"></div>
            <% sum += amount * product.getPrice(); } %>

            <div class="col-12">
                <h1 class="text-end">Jami: <%= sum %> UZS</h1>
            </div>
            <div class="col-12 text-end mt-3">
                <form action="/order" method="post">
                    <button class="btn btn-dark">Buyurtma</button>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>
