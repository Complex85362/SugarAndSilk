<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar & Silk | Login</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css?v=1.1">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        .image {
            background-image: url('${pageContext.request.contextPath}/images/Gemini_Generated_Image_1h1n141h1n141h1n.png');
        }

        
        .error-banner {
            color: #d32f2f;
            background-color: #ffebee;
            border: 1px solid #ffcdd2;
            padding: 10px;
            border-radius: 25px; 
            text-align: center;
            margin-bottom: 15px;
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
            font-weight: 600;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="image"></div>

        <div class="form">
            <h1 class="brand-name">Sugar & Silk</h1>
            
            <div class="login">
                <h2>Welcome Back</h2>
                <h3>Login</h3>
                
                <c:if test="${not empty errorMessage}">
                    <div class="error-banner">
                        ${errorMessage}
                    </div>
                </c:if>
                
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <div class="email">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="Enter your Email" required>
                    </div>
                    
                    <div class="pass">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" placeholder="Enter your Password" required>
                    </div>

                    <button type="submit" class="login-btn">Login</button>
                    <div class="form-link">
                        <span>Don't have an account? </span>
                        <a href="${pageContext.request.contextPath}/register">Register</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
	<c:if test="${not empty showInactiveModal && showInactiveModal}">
        <script type="text/javascript">
            alert("Your account is currently inactive. Contact the admin to active your account.");
        </script>
    </c:if>

</body>
</html>
