<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Computer Shop - Checkout</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="home">Computer Shop</a>
            <div>
                <c:if test="${sessionScope.user != null}">
                    Welcome, ${sessionScope.user.fullName}!
                    <a href="logout" class="btn btn-danger">Logout</a>
                </c:if>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2>Checkout</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${cartItems}" var="item">
                    <c:forEach items="${products}" var="product">
                        <c:if test="${product.productId == item.productId}">
                            <tr>
                                <td>${product.name}</td>
                                <td>${item.quantity}</td>
                                <td>$${product.price}</td>
                                <td>$${product.price * item.quantity}</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </tbody>
        </table>
        <h4>Total: $${total}</h4>
        <form action="checkout" method="post">
            <button type="submit" class="btn btn-success">Confirm Order</button>
            <a href="cart" class="btn btn-secondary">Back to Cart</a>
        </form>
    </div>
</body>
</html>