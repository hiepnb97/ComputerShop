<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Computer Shop - Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .navbar {
            background: linear-gradient(90deg, #2c3e50 0%, #34495e 100%) !important;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        
        .navbar-brand {
            color: white !important;
            font-weight: bold;
            font-size: 1.5rem;
        }
        
        .navbar-brand i {
            margin-right: 10px;
            color: #3498db;
        }
        
        .btn-modern {
            border-radius: 25px;
            padding: 8px 20px;
            font-weight: 500;
            transition: all 0.3s ease;
            margin: 0 5px;
        }
        
        .btn-modern:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .container-content {
            background: rgba(255,255,255,0.95);
            border-radius: 20px;
            padding: 30px;
            margin-top: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        
        .page-title {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-weight: bold;
        }
        
        .page-title i {
            color: #e74c3c;
            margin-right: 15px;
        }
        
        .empty-cart {
            text-align: center;
            padding: 50px;
            color: #7f8c8d;
        }
        
        .empty-cart i {
            font-size: 4rem;
            color: #bdc3c7;
            margin-bottom: 20px;
        }
        
        .cart-table {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }
        
        .cart-table thead {
            background: linear-gradient(90deg, #3498db, #2980b9);
            color: white;
        }
        
        .cart-table thead th {
            border: none;
            padding: 20px;
            font-weight: 600;
        }
        
        .cart-table tbody td {
            padding: 20px;
            border-color: #ecf0f1;
            vertical-align: middle;
        }
        
        .cart-table tbody tr:hover {
            background-color: #f8f9fa;
        }
        
        .product-name {
            font-weight: 600;
            color: #2c3e50;
        }
        
        .quantity-badge {
            background: linear-gradient(45deg, #9b59b6, #8e44ad);
            color: white;
            padding: 8px 15px;
            border-radius: 20px;
            font-weight: bold;
        }
        
        .price-cell {
            color: #27ae60;
            font-weight: bold;
            font-size: 1.1rem;
        }
        
        .total-cell {
            color: #e74c3c;
            font-weight: bold;
            font-size: 1.2rem;
        }
        
        .checkout-btn {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            border: none;
            border-radius: 25px;
            padding: 15px 30px;
            color: white;
            font-weight: 600;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            margin-right: 15px;
            text-decoration: none;
        }
        
        .checkout-btn:hover {
            background: linear-gradient(45deg, #c0392b, #a93226);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(231,76,60,0.3);
            color: white;
        }
        
        .continue-btn {
            background: linear-gradient(45deg, #95a5a6, #7f8c8d);
            border: none;
            border-radius: 25px;
            padding: 15px 30px;
            color: white;
            font-weight: 600;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            text-decoration: none;
        }
        
        .continue-btn:hover {
            background: linear-gradient(45deg, #7f8c8d, #707b7c);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(149,165,166,0.3);
            color: white;
        }
        
        .welcome-text {
            color: white;
            margin-right: 15px;
            font-weight: 500;
        }
        
        .user-menu {
            display: flex;
            align-items: center;
        }
        
        .button-container {
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="home">
                <i class="fas fa-laptop"></i>Computer Shop
            </a>
            <div class="user-menu">
                <c:if test="${sessionScope.user != null}">
                    <span class="welcome-text">
                        <i class="fas fa-user-circle"></i> Xin chào, ${sessionScope.user.fullName}!
                    </span>
                    <a href="logout" class="btn btn-danger btn-modern">
                        <i class="fas fa-sign-out-alt"></i> Đăng xuất
                    </a>
                </c:if>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="container-content">
            <h2 class="page-title">
                <i class="fas fa-shopping-cart"></i>Giỏ hàng của bạn
            </h2>
            
            <c:if test="${empty cartItems}">
                <div class="empty-cart">
                    <i class="fas fa-shopping-cart"></i>
                    <h4>Giỏ hàng trống</h4>
                    <p class="lead">Bạn chưa có sản phẩm nào trong giỏ hàng.</p>
                    <a href="home" class="btn continue-btn">
                        <i class="fas fa-arrow-left"></i> Tiếp tục mua sắm
                    </a>
                </div>
            </c:if>
            
            <c:if test="${not empty cartItems}">
                <div class="cart-table">
                    <table class="table table-hover mb-0">
                        <thead>
                            <tr>
                                <th><i class="fas fa-box"></i> Sản phẩm</th>
                                <th><i class="fas fa-sort-numeric-up"></i> Số lượng</th>
                                <th><i class="fas fa-dollar-sign"></i> Đơn giá</th>
                                <th><i class="fas fa-calculator"></i> Tổng tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${cartItems}" var="item">
                                <c:forEach items="${products}" var="product">
                                    <c:if test="${product.productId == item.productId}">
                                        <tr>
                                            <td>
                                                <div class="product-name">
                                                    ${product.name}
                                                </div>
                                            </td>
                                            <td>
                                                <span class="quantity-badge">
                                                    ${item.quantity}
                                                </span>
                                            </td>
                                            <td class="price-cell">
                                                $${product.price}
                                            </td>
                                            <td class="total-cell">
                                                $${product.price * item.quantity}
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                
                <div class="button-container">
                    <a href="checkout" class="checkout-btn">
                        <i class="fas fa-credit-card"></i> Thanh toán
                    </a>
                    <a href="home" class="continue-btn">
                        <i class="fas fa-arrow-left"></i> Tiếp tục mua sắm
                    </a>
                </div>
            </c:if>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>