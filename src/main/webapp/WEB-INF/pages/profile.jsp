<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar &amp; Silk | Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/profile.css">
</head>
<body>

    <%@ include file="header.jsp" %>

    <main class="profile-main">
        <h1 class="brand-title">Sugar &amp; Silk</h1>

        <%-- Flash messages (set by UpdateProfileServlet then cleared here) --%>
        <c:if test="${not empty sessionScope.profileSuccess}">
            <p class="flash-success">${sessionScope.profileSuccess}</p>
            <c:remove var="profileSuccess" scope="session"/>
        </c:if>
        <c:if test="${not empty sessionScope.profileError}">
            <p class="flash-error">${sessionScope.profileError}</p>
            <c:remove var="profileError" scope="session"/>
        </c:if>

        <%-- enctype="multipart/form-data" is required for file upload --%>
        <form action="${pageContext.request.contextPath}/updateProfile"
              method="post"
              enctype="multipart/form-data"
              class="profile-card">

            <%-- Top bar: back arrow + optional admin link --%>
            <div class="profile-top-bar">
                <a href="${pageContext.request.contextPath}/home" class="back-arrow">&larr;</a>
                <c:if test="${sessionScope.userRole eq 'admin'}">
                    <a href="${pageContext.request.contextPath}/dashboard" class="admin-dashboard-btn">Admin Dashboard</a>
                </c:if>
            </div>

            <%-- Avatar + upload button --%>
            <div class="profile-header">
                <div class="profile-avatar-wrapper">
                    <c:choose>
                        <c:when test="${not empty sessionScope.user.profileImage
                                        and sessionScope.user.profileImage ne 'profile_placeholder.png'}">
                            <img id="avatarPreview"
                                 src="${pageContext.request.contextPath}/images/${sessionScope.user.profileImage}"
                                 alt="Profile photo">
                        </c:when>
                        <c:otherwise>
                            <img id="avatarPreview"
                                 src="${pageContext.request.contextPath}/images/profile_placeholder.png"
                                 alt="Profile photo">
                        </c:otherwise>
                    </c:choose>
                </div>

                <%-- Hidden file input; button triggers it --%>
                <input type="file"
                       id="profileImageInput"
                       name="profileImage"
                       accept="image/*"
                       style="display:none;">
                <button type="button"
                        class="change-photo-btn"
                        onclick="document.getElementById('profileImageInput').click();">
                    Change Photo
                </button>
            </div>

            <%-- Editable fields --%>
            <div class="profile-form">

                <div class="input-group">
                    <label for="firstName">First Name</label>
                    <input type="text"
                           id="firstName"
                           name="firstName"
                           value="${sessionScope.user.firstName}"
                           required>
                </div>

                <div class="input-group">
                    <label for="lastName">Last Name</label>
                    <input type="text"
                           id="lastName"
                           name="lastName"
                           value="${sessionScope.user.lastName}"
                           required>
                </div>

                <%-- Read-only: cannot be changed --%>
                <div class="input-group">
                    <label>Username</label>
                    <input type="text"
                           value="${sessionScope.user.username}"
                           readonly
                           class="readonly-field">
                </div>

                <div class="input-group">
                    <label>Email</label>
                    <input type="email"
                           value="${sessionScope.user.email}"
                           readonly
                           class="readonly-field">
                </div>

                <div class="input-group">
                    <label for="address">Address</label>
                    <input type="text"
                           id="address"
                           name="address"
                           value="${sessionScope.user.address}">
                </div>

                <div class="button-container">
                    <button type="submit" class="save-btn">Save Changes</button>
                    <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
                </div>

            </div>
        </form>
    </main>

    <%@ include file="footer.jsp" %>

    <script>
        document.getElementById('profileImageInput').addEventListener('change', function () {
            var file = this.files[0];
            if (!file) return;
            var reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('avatarPreview').src = e.target.result;
            };
            reader.readAsDataURL(file);
        });
    </script>

</body>
</html>
