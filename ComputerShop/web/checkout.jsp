<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Computer Shop - Checkout</title>
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
            padding: 40px;
            margin-top: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        
        .page-title {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 40px;
            font-weight: bold;
        }
        
        .page-title i {
            color: #e67e22;
            margin-right: 15px;
        }
        
        .checkout-section {
            background: white;
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            border-left: 5px solid #3498db;
        }
        
        .section-title {
            color: #2c3e50;
            font-weight: bold;
            margin-bottom: 25px;
            padding-bottom: 10px;
            border-bottom: 2px solid #ecf0f1;
        }
        
        .section-title i {
            color: #3498db;
            margin-right: 10px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-control-modern {
            border: 2px solid #ecf0f1;
            border-radius: 10px;
            padding: 12px 15px;
            transition: all 0.3s ease;
        }
        
        .form-control-modern:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 3px rgba(52,152,219,0.1);
        }
        
        .form-label-modern {
            color: #2c3e50;
            font-weight: 600;
            margin-bottom: 8px;
        }
        
        .order-summary {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border-radius: 15px;
            padding: 25px;
            border: none;
        }
        
        .summary-title {
            color: #2c3e50;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }
        
        .summary-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid #dee2e6;
        }
        
        .summary-item:last-child {
            border-bottom: none;
            border-top: 2px solid #3498db;
            padding-top: 15px;
            margin-top: 10px;
        }
        
        .summary-item.total {
            font-weight: bold;
            font-size: 1.2rem;
            color: #e74c3c;
        }
        
        .product-name {
            color: #2c3e50;
            font-weight: 500;
        }
        
        .product-price {
            color: #27ae60;
            font-weight: bold;
        }
        
        .btn-place-order {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            border: none;
            border-radius: 15px;
            padding: 15px 30px;
            color: white;
            font-weight: 600;
            font-size: 1.2rem;
            width: 100%;
            transition: all 0.3s ease;
            margin-top: 20px;
        }
        
        .btn-place-order:hover {
            background: linear-gradient(45deg, #c0392b, #a93226);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(231,76,60,0.3);
            color: white;
        }
        
        .btn-back {
            background: linear-gradient(45deg, #95a5a6, #7f8c8d);
            border: none;
            border-radius: 15px;
            padding: 12px 25px;
            color: white;
            font-weight: 500;
            transition: all 0.3s ease;
            width: 100%;
            margin-top: 15px;
        }
        
        .btn-back:hover {
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
        
        .payment-methods {
            display: flex;
            gap: 15px;
            margin-top: 15px;
        }
        
        .payment-method {
            flex: 1;
            padding: 15px;
            border: 2px solid #ecf0f1;
            border-radius: 10px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .payment-method:hover {
            border-color: #3498db;
            background-color: #f8f9fa;
        }
        
        .payment-method.selected {
            border-color: #3498db;
            background-color: #e3f2fd;
        }
        
        .payment-method i {
            font-size: 2rem;
            color: #3498db;
            margin-bottom: 10px;
        }
        
        .security-badge {
            background: linear-gradient(45deg, #27ae60, #2ecc71);
            color: white;
            padding: 10px 15px;
            border-radius: 8px;
            text-align: center;
            margin-top: 20px;
            font-size: 0.9rem;
        }
        
        .security-badge i {
            margin-right: 8px;
        }
        
        .step-indicator {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }
        
        .step {
            display: flex;
            align-items: center;
            margin: 0 10px;
        }
        
        .step-number {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background: #3498db;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            margin-right: 8px;
        }
        
        .step-title {
            color: #2c3e50;
            font-weight: 500;
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
                <i class="fas fa-credit-card"></i>Thanh toán đơn hàng
            </h2>
            
            <div class="step-indicator">
                <div class="step">
                    <div class="step-number">1</div>
                    <div class="step-title">Giỏ hàng</div>
                </div>
                <div class="step">
                    <div class="step-number">2</div>
                    <div class="step-title">Thanh toán</div>
                </div>
                <div class="step">
                    <div class="step-number">3</div>
                    <div class="step-title">Hoàn thành</div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-8">
                    <div class="checkout-section">
                        <h4 class="section-title">
                            <i class="fas fa-user"></i>Thông tin giao hàng
                        </h4>
                        <form action="process-order" method="post">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label-modern">Họ và tên</label>
                                        <input type="text" class="form-control form-control-modern" 
                                               value="${sessionScope.user.fullName}" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label-modern">Số điện thoại</label>
                                        <input type="tel" class="form-control form-control-modern" 
                                               placeholder="Nhập số điện thoại" required>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label-modern">Địa chỉ giao hàng</label>
                                <input type="text" class="form-control form-control-modern" 
                                       placeholder="Nhập địa chỉ chi tiết" required>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-label-modern">Tỉnh/Thành phố</label>
                                        <select class="form-control form-control-modern" required>
                                            <option value="">Chọn tỉnh/thành</option>
                                            <option value="hanoi">Hà Nội</option>
                                            <option value="hcm">TP. Hồ Chí Minh</option>
                                            <option value="danang">Đà Nẵng</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-label-modern">Quận/Huyện</label>
                                        <select class="form-control form-control-modern" required>
                                            <option value="">Chọn quận/huyện</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-label-modern">Phường/Xã</label>
                                        <select class="form-control form-control-modern" required>
                                            <option value="">Chọn phường/xã</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            
                            <h4 class="section-title mt-4">
                                <i class="fas fa-credit-card"></i>Phương thức thanh toán
                            </h4>
                            
                            <div class="payment-methods">
                                <div class="payment-method selected" data-method="cod">
                                    <i class="fas fa-money-bill-wave"></i>
                                    <div>Thanh toán khi nhận hàng</div>
                                </div>
                                <div class="payment-method" data-method="bank">
                                    <i class="fas fa-university"></i>
                                    <div>Chuyển khoản ngân hàng</div>
                                </div>
                                <div class="payment-method" data-method="card">
                                    <i class="fas fa-credit-card"></i>
                                    <div>Thẻ tín dụng</div>
                                </div>
                            </div>
                            
                            <div class="security-badge">
                                <i class="fas fa-shield-alt"></i>
                                Thông tin của bạn được bảo mật 100% với công nghệ mã hóa SSL
                            </div>
                        </form>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="order-summary">
                        <h4 class="summary-title">
                            <i class="fas fa-receipt"></i> Tóm tắt đơn hàng
                        </h4>
                        
                        <c:set var="total" value="0" />
                        <c:forEach items="${cartItems}" var="item">
                            <c:forEach items="${products}" var="product">
                                <c:if test="${product.productId == item.productId}">
                                    <div class="summary-item">
                                        <div>
                                            <div class="product-name">${product.name}</div>
                                            <small class="text-muted">Số lượng: ${item.quantity}</small>
                                        </div>
                                        <div class="product-price">$${product.price * item.quantity}</div>
                                    </div>
                                    <c:set var="total" value="${total + (product.price * item.quantity)}" />
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                        
                        <div class="summary-item">
                            <div>Phí vận chuyển</div>
                            <div class="product-price">$5.00</div>
                        </div>
                        
                        <div class="summary-item total">
                            <div>Tổng cộng</div>
                            <div>$${total + 5}</div>
                        </div>
                        <form action="checkout" method="POST">
                            <button type="submit" class="btn btn-place-order">
                                <i class="fas fa-shopping-bag"></i> Đặt hàng ngay
                            </button>
                        </form>
                        
                        <a href="cart" class="btn btn-back">
                            <i class="fas fa-arrow-left"></i> Quay lại giỏ hàng
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Payment method selection
        document.querySelectorAll('.payment-method').forEach(method => {
            method.addEventListener('click', function() {
                document.querySelectorAll('.payment-method').forEach(m => m.classList.remove('selected'));
                this.classList.add('selected');
            });
        });
    </script>
</body>
</html>