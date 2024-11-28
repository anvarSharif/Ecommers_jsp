<%@ page import="uz.pdp.homework_4jspinternetmagazin.DB" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.Category" %>
<%@ page import="uz.pdp.homework_4jspinternetmagazin.entity.Product" %><%--
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
<%
    String productId = request.getParameter("productId");
    Product product = null;
    if (productId != null) {
        product = DB.products.stream().filter(item -> item.getId().equals(Integer.parseInt(productId))).findAny().get();
    }
%>
<div class="container mt-5">
    <div class="card">
        <div class="card-body">
            <h3 class="card-title text-center mb-4"><%=product != null ? "Update" : "Add"%> Product</h3>
            <form action="<%=product!=null?"/product/update":"/product/add"%>" method="post"
                  enctype="multipart/form-data">
                <input type="hidden" name="productId" value="<%=productId%>">
                <div class="mb-3">
                    <label for="name1" class="form-label">
                        <%
                            if (product != null && product.getPhotoUrl() != null) {
                        %>
                        <img src="/file/<%=product.getId()%>" alt="Current image" class="" width="100">
                        <% }%>
                    </label>
                    <input type="file" class="form-control" value="<%=product!=null?"/file/"+productId:""%>"
                           id="name1" <%=product!=null?"":"required"%> name="productImage">

                </div>
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" value="<%=product!=null?product.getName():""%>"
                           id="name" name="name" placeholder="Mahsulot nomini kiriting" required>
                </div>

                <div class="mb-3">
                    <label for="price" class="form-label">Price</label>
                    <input type="number" class="form-control" value="<%=product!=null?product.getPrice():""%>"
                           id="price" name="price" placeholder="Narxini kiriting" min="1" required>
                </div>

                <div class="mb-3">
                    <label for="category" class="form-label">Kategoriya</label>
                    <select class="form-select" id="category" name="categoryId" required>
                        <option value="" disabled selected>Kategoriyani tanlang</option>
                        <% for (Category category : DB.categories) { %>
                        <option <%=product != null ? product.getCategoryId().equals(category.getId()) ? "selected" : "" : ""%>
                                value="<%= category.getId() %>"><%= category.getName() %>
                        </option>
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
