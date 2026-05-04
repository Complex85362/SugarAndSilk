<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar & Silk | Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/profile.css">
</head>
<body>

    <%@ include file="header.jsp" %>

    <main class="profile-main">
        <h1 class="brand-title">Sugar & Silk</h1>
        
        <div class="profile-card">
            <a href="${pageContext.request.contextPath}/home" class="back-arrow">←</a>
            
            <div class="profile-header">
                <div class="profile-avatar">👤</div>
                <button type="button" class="change-photo-btn">Change Photo Image</button>
            </div>

            <div class="profile-form">
                <div class="input-group">
                    <label>First Name</label>
                    <input type="text" value="John" readonly>
                </div>

                <div class="input-group">
                    <label>Last Name</label>
                    <input type="text" value="Doe" readonly>
                </div>

                <div class="input-group">
                    <label>User Name</label>
                    <input type="text" value="johndoe99" readonly>
                </div>

                <div class="input-group">
                    <label>Email</label>
                    <input type="email" value="john@gmail.com" readonly>
                </div>

                <div class="input-group">
                    <label>Address</label>
                    <input type="text" value="Kathmandu" readonly>
                </div>

                <div class="input-group">
                    <label>Phone Number</label>
                    <input type="text" value="9881992891" readonly>
                </div>

                <div class="button-container">
			    <button type="button" class="save-btn">Save Changes</button>
			    <!-- Logout link mapped to your LogoutServlet -->
			    <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
			</div>
            </div>
        </div>
    </main>

    <%@ include file="footer.jsp" %>

</body>
</html>