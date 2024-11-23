<%@ page import="uz.pdp.homework_4jspinternetmagazin.DB" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.Category" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Optional" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 18/11/2024
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-3 vh-100 p-3 card">
            <div class="list-group">
                <form action="/order.jsp">
                    <button class="btn btn-secondary w-100 my-1">
                        Orders
                    </button>
                </form>
                <form action="/category.jsp">
                    <button class="btn btn-secondary w-100 my-1">
                        Category
                    </button>
                </form>
                <form action="/product.jsp">
                    <button class="btn btn-secondary w-100 my-1">
                        Product
                    </button>
                </form>
            </div>
        </div>

        <div class="col-9 p-4 card">
            <form action="addProduct.jsp">
                <button class="btn btn-dark w-25">
                    Add Product
                </button>
            </form>
            <h3 class="mb-4">Mahsulotlar</h3>

            <div class="d-flex justify-content-between m-3">
                <%
                    if (request.getCookies() != null) {
                        Optional<Cookie> optionalCookie = Arrays.stream(request.getCookies()).filter(item -> item.getName().equals("token")).findFirst();
                        if (optionalCookie.isPresent()) {%>
                <a href="order.jsp" class="btn btn-dark">
                    Orders
                </a>
                <%
                        }
                    }
                %>
                <a href="login.jsp" class="btn btn-dark mx-2">
                    Login
                </a>
                <a href="basket.jsp" class="btn btn-dark">
                    Savatcha (<%=DB
                        .
                        savatcha
                                .
                        size
                                (
                                )%>)
                </a>
            </div>

            <div class="row">
                <% for
                (
                        Product
                                product
                        :
                        DB
                                .
                                products
                ) { %>
                <div class="col-3">
                    <div class="card text-center mb-4">
                        <img src="/file/<%= product.getId() %>" class="card-img-top" alt="rasm topilmadi!"
                             style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title"><%= product
                                    .
                                    getName
                                            (
                                            ) %>
                            </h5>
                            <p class="card-text">Narxi: <strong><%= product
                                    .
                                    getPrice
                                            (
                                            ) %> UZS</strong></p>
                            <form action="/product" method="post">
                                <input type="hidden" name="productId" value="<%= product.getId() %>">
                                <% if
                                (
                                        product
                                                .
                                                isChecked
                                                        (
                                                        )
                                ) { %>
                                <button class="btn btn-danger">X</button>
                                <% } else { %>
                                <button class="btn btn-dark">Select</button>
                                <% } %>
                            </form>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</div>
</body>
</html>
