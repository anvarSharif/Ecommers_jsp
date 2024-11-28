<%@ page import="uz.pdp.homework_4jspinternetmagazin.DB" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.Category" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.Product" %>
<%@ page import="java.util.*" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.Basket" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.User" %><%--
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
<%
    List<Product> products = DB.products;
    String categoryId = request.getParameter("categoryId");
    if (categoryId != null) {
        products = DB.products.stream().filter(item -> item.getCategoryId().equals(Integer.parseInt(categoryId))).toList();
    }
    Basket basket = (Basket) Objects.requireNonNullElse(session.getAttribute("basket"), new Basket());
    User user = (User) session.getAttribute("user");
%>

<div class="container-fluid">
    <div class="row">
        <div class="col-3 vh-100 p-3 card">
            <div class="list-group" z>

                <form action="/home.jsp">
                    <button class="btn btn-secondary w-100 my-1">
                        All
                    </button>
                </form>

                <%for (Category category : DB.categories) {%>
                <form action="/home.jsp">
                    <input type="hidden" name="categoryId" value="<%=category.getId()%>">
                    <button class="btn btn-secondary w-100 my-1">
                        <%=category.getName()%>
                    </button>
                </form>
                <%}%>
            </div>
        </div>

        <div class="col-9 card">
            <div class="d-flex justify-content-between m-2  bg-dark text-white">
                <%
                    if (user != null) {%>
                <div class="justify-content-center w-25 m-2">
                    <a href="order.jsp">
                        My Orders
                    </a>
                </div>
                <%}%>

                <div class="justify-content-center w-25 m-2">
                    <%if (user != null) {%>
                    <form action="/auth/logout" method="post">
                        <button class="btn btn-dark">
                            Logout
                        </button>
                    </form>

                    <%} else {%>
                    <a href="/auth/login.jsp">
                        Login
                    </a>
                    <%}%>
                </div>
                <div>
                    <%if (user != null) {%>
                    <img src="/user/file/<%=user.getId()%>" height="50" width="50" class="rounded-circle"
                         alt="topilmadi">
                    <%=user.getPhone()%>
                    <%}%>

                </div>

            </div>
            <div class="justify-content-end w-25">
                <a href="basket.jsp" class="btn btn-dark">
                    Savatcha (<%=basket.getMap().size()%>)
                </a>
            </div>

            <div class="row">

                <% for
                (Product product : products) { %>
                <div class="col-3">
                    <div class="card text-center mb-4">
                        <img src="/file/<%= product.getId() %>" class="card-img-top" alt="rasm topilmadi!"
                             style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title"><%= product.getName() %>
                            </h5>
                            <p class="card-text">Narxi: <strong><%= product.getPrice() %> UZS</strong></p>

                            <% if (basket.getMap().containsKey(product)) { %>
                            <form action="/basket/delete" method="post">
                                <input type="hidden" name="productId" value="<%= product.getId() %>">
                                <input type="hidden" name="categoryId" value="<%= categoryId!=null?categoryId:"non" %>">
                                <button class="btn btn-danger">X</button>
                            </form>
                            <% } else { %>
                            <form action="/basket/add" method="post">
                                <input type="hidden" name="productId" value="<%= product.getId() %>">
                                <input type="hidden" name="categoryId" value="<%= categoryId!=null?categoryId:"non" %>">
                                <button class="btn btn-dark">Select</button>
                            </form>
                            <% } %>
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
