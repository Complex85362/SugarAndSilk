<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar & Silk | Login</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        .image {
            background-image: url('${pageContext.request.contextPath}/images/pexels-bi-ravencrow-2154273033-33327470.jpg');
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
                
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <div class="email">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="Enter your Email" required>
                    </div>
                    
                    <div class="pass">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" placeholder="Enter your Password" required>
                    </div>
                    <c:if test="${not empty errorMessage}">
					    <p style="color: red;">${errorMessage}</p>
					</c:if>
                    <button type="submit" class="login-btn">Login</button>
                    <div class="form-link">
                        <span>Don't have an account? </span>
                        <a href="${pageContext.request.contextPath}/register">Register</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>