<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Computer Shop - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .login-container {
            background: rgba(255,255,255,0.95);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 450px;
            backdrop-filter: blur(10px);
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 40px;
        }
        
        .login-title {
            color: #2c3e50;
            font-weight: bold;
            font-size: 2rem;
            margin-bottom: 10px;
        }
        
        .login-title i {
            color: #3498db;
            margin-right: 15px;
        }
        
        .login-subtitle {
            color: #7f8c8d;
            font-size: 1rem;
        }
        
        .form-group {
            position: relative;
            margin-bottom: 25px;
        }
        
        .form-control-modern {
            border: 2px solid #ecf0f1;
            border-radius: 15px;
            padding: 15px 20px 15px 50px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: rgba(255,255,255,0.9);
        }
        
        .form-control-modern:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 3px rgba(52,152,219,0.1);
            background: white;
        }
        
        .input-icon {
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            color: #7f8c8d;
            font-size: 1.1rem;
            z-index: 5;
        }
        
        .form-label-modern {
            color: #2c3e50;
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 0.95rem;
        }
        
        .btn-login {
            background: linear-gradient(45deg, #3498db, #2980b9);
            border: none;
            border-radius: 15px;
            padding: 15px;
            color: white;
            font-weight: 600;
            font-size: 1.1rem;
            width: 100%;
            transition: all 0.3s ease;
            margin-bottom: 20px;
        }
        
        .btn-login:hover {
            background: linear-gradient(45deg, #2980b9, #21618c);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(52,152,219,0.3);
            color: white;
        }
        
        .btn-register {
            background: linear-gradient(45deg, #95a5a6, #7f8c8d);
            border: none;
            border-radius: 15px;
            padding: 12px;
            color: white;
            font-weight: 500;
            width: 100%;
            transition: all 0.3s ease;
        }
        
        .btn-register:hover {
            background: linear-gradient(45deg, #7f8c8d, #707b7c);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(149,165,166,0.3);
            color: white;
        }
        
        .alert-modern {
            border-radius: 15px;
            border: none;
            padding: 15px 20px;
            margin-bottom: 25px;
            box-shadow: 0 5px 15px rgba(231,76,60,0.1);
        }
        
        .divider {
            text-align: center;
            margin: 20px 0;
            color: #7f8c8d;
            position: relative;
        }
        
        .divider::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            height: 1px;
            background: linear-gradient(90deg, transparent, #bdc3c7, transparent);
        }
        
        .divider span {
            background: rgba(255,255,255,0.95);
            padding: 0 20px;
            font-size: 0.9rem;
        }
        
        .brand-logo {
            position: absolute;
            top: 20px;
            left: 20px;
            color: white;
            text-decoration: none;
            font-weight: bold;
            font-size: 1.2rem;
            transition: all 0.3s ease;
        }
        
        .brand-logo:hover {
            color: #f39c12;
            text-decoration: none;
        }
        
        .brand-logo i {
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <a href="home" class="brand-logo">
        <i class="fas fa-laptop"></i>Computer Shop
    </a>
    
    <div class="login-container">
        <div class="login-header">
            <h2 class="login-title">
                <i class="fas fa-sign-in-alt"></i>Đăng nhập
            </h2>
            <p class="login-subtitle">Chào mừng trở lại! Vui lòng đăng nhập vào tài khoản của bạn.</p>
        </div>
        
        <c:if test="${not empty error}">
            <div class="alert alert-danger alert-modern">
                <i class="fas fa-exclamation-triangle"></i> ${error}
            </div>
        </c:if>
        
        <form action="login" method="post">
            <div class="form-group">
                <label for="username" class="form-label-modern">
                    <i class="fas fa-user"></i> Tên đăng nhập
                </label>
                <div class="position-relative">
                    <i class="fas fa-user input-icon"></i>
                    <input type="text" class="form-control form-control-modern" id="username" name="username" 
                           placeholder="Nhập tên đăng nhập" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="password" class="form-label-modern">
                    <i class="fas fa-lock"></i> Mật khẩu
                </label>
                <div class="position-relative">
                    <i class="fas fa-lock input-icon"></i>
                    <input type="password" class="form-control form-control-modern" id="password" name="password" 
                           placeholder="Nhập mật khẩu" required>
                </div>
            </div>
            
            <button type="submit" class="btn btn-login">
                <i class="fas fa-sign-in-alt"></i> Đăng nhập
            </button>
            
            <div class="divider">
                <span>Hoặc</span>
            </div>
            
            <a href="register" class="btn btn-register">
                <i class="fas fa-user-plus"></i> Tạo tài khoản mới
            </a>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>