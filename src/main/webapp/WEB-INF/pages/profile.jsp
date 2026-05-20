<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar & Silk | Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/profile.css?v=3.2">
</head>
<body>

    <%@ include file="header.jsp" %>

    <main class="profile-main">
        <h1 class="brand-title">Sugar & Silk</h1>
        
        <div class="profile-card">
            
            <div class="profile-top-bar" style="display: flex; justify-content: space-between; align-items: center; width: 100%; margin-bottom: 20px;">
                <a href="${pageContext.request.contextPath}/home" class="back-arrow">&larr;</a>
                
                <%-- CONDITIONAL RENDER: Visible strictly to users authenticated as administrators --%>
                <c:if test="${sessionScope.userRole eq 'admin'}">
                    <%-- FIX: Removed the extra '/admin/' segment so it routes directly to your mapped Dashboard Servlet pattern --%>
                    <a href="${pageContext.request.contextPath}/dashboard" class="admin-dashboard-btn">Admin Dashboard</a>
                </c:if>
            </div>
            
            <div class="profile-header">
                <div class="profile-avatar">👤</div>
                <button type="button" class="change-photo-btn">Change Photo Image</button>
            </div>

            <div class="profile-form">
                <div class="input-group">
                    <label>First Name</label>
                    <input type="text" value="${sessionScope.user.firstName}" readonly>
                </div>

                <div class="input-group">
                    <label>Last Name</label>
                    <input type="text" value="${sessionScope.user.lastName}" readonly>
                </div>

                <div class="input-group">
                    <label>User Name</label>
                    <input type="text" value="${sessionScope.user.username}" readonly>
                </div>

                <div class="input-group">
                    <label>Email</label>
                    <input type="email" value="${sessionScope.user.email}" readonly>
                </div>

                <div class="input-group">
                    <label>Address</label>
                    <input type="text" value="${sessionScope.user.address}" readonly>
                </div>

                <div class="input-group">
                    <label>Phone Number</label>
                    <input type="text" value="${sessionScope.user.phoneNumber}" readonly>
                </div>

                <div class="button-container">
                    <button type="button" class="save-btn">Save Changes</button>
                    <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
                </div>
            </div>
        </div>
    </main>

    <%-- REMOVED: Duplicate rogue admin button loop that was hanging down here --%>

    <%@ include file="footer.jsp" %>

</body>
</html>