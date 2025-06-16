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
        
        .search-container {
            position: relative;
        }
        
        .search-container .btn {
            border-radius: 0 25px 25px 0;
        }
        
        .search-container .form-control {
            border-radius: 25px 0 0 25px;
            border-right: none;
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
            color: #3498db;
            margin-right: 15px;
        }
        
        .product-card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            height: 100%;
        }
        
        .product-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }
        
        .product-card img {
            height: 200px;
            object-fit: cover;
            transition: all 0.3s ease;
        }
        
        .product-card:hover img {
            transform: scale(1.05);
        }
        
        .card-body {
            padding: 20px;
        }
        
        .price-tag {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: bold;
            display: inline-block;
            margin: 10px 0;
        }
        
        .add-to-cart-btn {
            background: linear-gradient(45deg, #27ae60, #2ecc71);
            border: none;
            border-radius: 25px;
            padding: 10px 20px;
            color: white;
            font-weight: 500;
            transition: all 0.3s ease;
            width: 100%;
        }
        
        .add-to-cart-btn:hover {
            background: linear-gradient(45deg, #229954, #27ae60);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(39,174,96,0.3);
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
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="home">
                <i class="fas fa-laptop"></i>Computer Shop
            </a>
            <form class="d-flex search-container" action="search" method="get">
                <input class="form-control me-0" type="search" name="keyword" placeholder="🔍 Search products...">
                <button class="btn btn-success" type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </form>
            <div class="user-menu">
                <c:if test="${sessionScope.user != null}">
                    <span class="welcome-text">
                        <i class="fas fa-user-circle"></i> Xin chào, ${sessionScope.user.fullName}!
                    </span>
                    <a href="cart" class="btn btn-warning btn-modern">
                        <i class="fas fa-shopping-cart"></i> Giỏ hàng
                    </a>
                    <a href="logout" class="btn btn-danger btn-modern">
                        <i class="fas fa-sign-out-alt"></i> Đăng xuất
                    </a>
                </c:if>
                <c:if test="${sessionScope.user == null}">
                    <a href="login" class="btn btn-primary btn-modern">
                        <i class="fas fa-sign-in-alt"></i> Đăng nhập
                    </a>
                    <a href="register" class="btn btn-secondary btn-modern">
                        <i class="fas fa-user-plus"></i> Đăng ký
                    </a>
                </c:if>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="container-content">
            <h2 class="page-title">
                <i class="fas fa-store"></i>Sản phẩm nổi bật
            </h2>
            <div class="row">
                <c:forEach items="${products}" var="product">
                    <div class="col-md-4 mb-4">
                        <div class="card product-card">
                            <img src="images/${product.imageUrl}" class="card-img-top" alt="${product.name}">
                            <div class="card-body">
                                <h5 class="card-title">
                                    ${product.name}
                                </h5>
                                <p class="card-text text-muted">${product.description}</p>
                                <div class="price-tag">
                                    <i class="fas fa-dollar-sign"></i> ${product.price}
                                </div>
                                <br>
                                <form action="add-to-cart" method="POST">
                                    <input type="hidden" name="productId" value="${product.productId}" />
                                    <button type="submit" class="btn add-to-cart-btn"><i class="fas fa-cart-plus"></i> Thêm vào giỏ</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>