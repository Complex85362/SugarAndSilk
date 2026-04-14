<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar & Silk | Register</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>

    <div class="container">
        <div class="image"></div>

        <div class="form">
            <h1 class="brand-name">Sugar & Silk</h1>
            
            <div class="reg">
                <h2>Register</h2>
                
                <form action="${pageContext.request.contextPath}/register" method="post">
                    
                    <div class="name">
                        <label for="name">Name</label>
                        <input type="text" id="name" name="name" placeholder="Enter your Name" required>
                    </div>
                    
                    <div class="address">
                        <label for="address">Address</label>
                        <input type="text" id="address" name="address" placeholder="Enter your Address" required>
                    </div>
                    
                    <div class="email">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="Enter your Email" required>
                    </div>
                    
                    <div class="pass">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" placeholder="Enter your Password" required>
                    </div>
                    
                    <div class="cpass">
                        <label for="confirm-password">Confirm Password</label>
                        <input type="password" id="confirm-password" name="confirm-password" placeholder="Re-enter your Password" required>
                    </div>
                    
                    <button type="submit" class="login-btn">Register</button>
                    
                    <div class="form-link">
                        <span>Already have an account? </span>
                        <a href="${pageContext.request.contextPath}/login">Login</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>