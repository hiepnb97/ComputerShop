<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Computer Shop - Register</title>
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
            padding: 20px 0;
        }
        
        .register-container {
            background: rgba(255,255,255,0.95);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 500px;
            backdrop-filter: blur(10px);
        }
        
        .register-header {
            text-align: center;
            margin-bottom: 40px;
        }
        
        .register-title {
            color: #2c3e50;
            font-weight: bold;
            font-size: 2rem;
            margin-bottom: 10px;
        }
        
        .register-title i {
            color: #27ae60;
            margin-right: 15px;
        }
        
        .register-subtitle {
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
            border-color: #27ae60;
            box-shadow: 0 0 0 3px rgba(39,174,96,0.1);
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
        
        .btn-register {
            background: linear-gradient(45deg, #27ae60, #2ecc71);
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
        
        .btn-register:hover {
            background: linear-gradient(45deg, #229954, #27ae60);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(39,174,96,0.3);
            color: white;
        }
        
        .btn-login-link {
            background: linear-gradient(45deg, #3498db, #2980b9);
            border: none;
            border-radius: 15px;
            padding: 12px;
            color: white;
            font-weight: 500;
            width: 100%;
            transition: all 0.3s ease;
        }
        
        .btn-login-link:hover {
            background: linear-gradient(45deg, #2980b9, #21618c);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(52,152,219,0.3);
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
        
        .form-row {
            display: flex;
            gap: 15px;
        }
        
        .form-row .form-group {
            flex: 1;
        }
        
        .password-strength {
            height: 3px;
            border-radius: 2px;
            background: #ecf0f1;
            margin-top: 8px;
            overflow: hidden;
        }
        
        .password-strength-bar {
            height: 100%;
            transition: all 0.3s ease;
            border-radius: 2px;
        }
        
        .strength-weak { background: #e74c3c; width: 25%; }
        .strength-medium { background: #f39c12; width: 50%; }
        .strength-strong { background: #27ae60; width: 100%; }
        
        .form-info {
            font-size: 0.85rem;
            color: #7f8c8d;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <a href="home" class="brand-logo">
        <i class="fas fa-laptop"></i>Computer Shop
    </a>
    
    <div class="register-container">
        <div class="register-header">
            <h2 class="register-title">
                <i class="fas fa-user-plus"></i>Đăng ký
            </h2>
            <p class="register-subtitle">Tạo tài khoản mới để bắt đầu mua sắm tại Computer Shop.</p>
        </div>
        
        <c:if test="${not empty error}">
            <div class="alert alert-danger alert-modern">
                <i class="fas fa-exclamation-triangle"></i> ${error}
            </div>
        </c:if>
        
        <form action="register" method="post">
            <div class="form-group">
                <label for="fullName" class="form-label-modern">
                    <i class="fas fa-id-card"></i> Họ và tên
                </label>
                <div class="position-relative">
                    <i class="fas fa-id-card input-icon"></i>
                    <input type="text" class="form-control form-control-modern" id="fullName" name="fullName" 
                           placeholder="Nhập họ và tên đầy đủ" required>
                </div>
                <div class="form-info">Ví dụ: Nguyễn Văn A</div>
            </div>
            
            <div class="form-group">
                <label for="username" class="form-label-modern">
                    <i class="fas fa-user"></i> Tên đăng nhập
                </label>
                <div class="position-relative">
                    <i class="fas fa-user input-icon"></i>
                    <input type="text" class="form-control form-control-modern" id="username" name="username" 
                           placeholder="Chọn tên đăng nhập" required>
                </div>
                <div class="form-info">Tên đăng nhập phải có ít nhất 3 ký tự</div>
            </div>
            
            <div class="form-group">
                <label for="email" class="form-label-modern">
                    <i class="fas fa-envelope"></i> Email
                </label>
                <div class="position-relative">
                    <i class="fas fa-envelope input-icon"></i>
                    <input type="email" class="form-control form-control-modern" id="email" name="email" 
                           placeholder="Nhập địa chỉ email" required>
                </div>
                <div class="form-info">Chúng tôi sẽ gửi thông báo đơn hàng qua email này</div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="password" class="form-label-modern">
                        <i class="fas fa-lock"></i> Mật khẩu
                    </label>
                    <div class="position-relative">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" class="form-control form-control-modern" id="password" name="password" 
                               placeholder="Tạo mật khẩu" required>
                    </div>
                    <div class="password-strength">
                        <div class="password-strength-bar strength-weak" id="strengthBar"></div>
                    </div>
                    <div class="form-info">Ít nhất 6 ký tự, bao gồm chữ và số</div>
                </div>
                
                <div class="form-group">
                    <label for="confirmPassword" class="form-label-modern">
                        <i class="fas fa-lock"></i> Xác nhận mật khẩu
                    </label>
                    <div class="position-relative">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" class="form-control form-control-modern" id="confirmPassword" name="confirmPassword" 
                               placeholder="Nhập lại mật khẩu" required>
                    </div>
                </div>
            </div>
            
            <button type="submit" class="btn btn-register">
                <i class="fas fa-user-plus"></i> Tạo tài khoản
            </button>
            
            <div class="divider">
                <span>Đã có tài khoản?</span>
            </div>
            
            <a href="login" class="btn btn-login-link">
                <i class="fas fa-sign-in-alt"></i> Đăng nhập ngay
            </a>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Password strength indicator
        document.getElementById('password').addEventListener('input', function() {
            const password = this.value;
            const strengthBar = document.getElementById('strengthBar');
            
            if (password.length < 4) {
                strengthBar.className = 'password-strength-bar strength-weak';
            } else if (password.length < 8) {
                strengthBar.className = 'password-strength-bar strength-medium';
            } else {
                strengthBar.className = 'password-strength-bar strength-strong';
            }
        });
        
        // Password confirmation validation
        document.getElementById('confirmPassword').addEventListener('input', function() {
            const password = document.getElementById('password').value;
            const confirmPassword = this.value;
            
            if (password !== confirmPassword) {
                this.setCustomValidity('Mật khẩu không khớp');
            } else {
                this.setCustomValidity('');
            }
        });
    </script>
</body>
</html>