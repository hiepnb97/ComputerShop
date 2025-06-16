<%-- 
    Document   : home
    Created on : Jun 16, 2025, 10:44:21 PM
    Author     : hiepn
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Computer Shop - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="home">Computer Shop</a>
            <form class="d-flex" action="search" method="get">
                <input class="form-control me-2" type="search" name="keyword" placeholder="Search products">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
            <div>
                <c:if test="${sessionScope.user != null}">
                    Welcome, ${sessionScope.user.fullName}!
                    <a href="cart" class="btn btn-primary">Cart</a>
                    <a href="logout" class="btn btn-danger">Logout</a>
                </c:if>
                <c:if test="${sessionScope.user == null}">
                    <a href="login" class="btn btn-primary">Login</a>
                    <a href="register" class="btn btn-secondary">Register</a>
                </c:if>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2>Products</h2>
        <div class="row">
            <c:forEach items="${products}" var="product">
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="images/${product.imageUrl}" class="card-img-top" alt="${product.name}">
                        <div class="card-body">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="card-text">${product.description}</p>
                            <p class="card-text">Price: $${product.price}</p>
                            <a href="add-to-cart?productId=${product.productId}" class="btn btn-primary">Add to Cart</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>