<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar & Silk | Command Center</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dashboard.css?v=4.6">
</head>
<body>

    <div class="admin-layout">
        
        <aside class="sidebar-panel">
            <div class="sidebar-brand">
                <a href="${pageContext.request.contextPath}/home" class="sidebar-brand-link">
                    <h2>S&S</h2>
                    <span>Sugar & Silk</span>
                </a>
            </div>
            
            <nav class="sidebar-menu">
                <a href="${pageContext.request.contextPath}/dashboard" class="menu-item active">Command Center</a>
                <a href="${pageContext.request.contextPath}/addProduct" class="menu-item">Add Product</a>
                <a href="${pageContext.request.contextPath}/productManagement" class="menu-item">Product Management</a>
                <a href="${pageContext.request.contextPath}/addNews" class="menu-item">Add News</a>
                <a href="${pageContext.request.contextPath}/newsManagement" class="menu-item">News Management</a>
                <a href="${pageContext.request.contextPath}/enquiryManagement" class="menu-item">Enquiries</a>
            </nav>
            
            <div class="sidebar-footer">
                <a href="${pageContext.request.contextPath}/logout" class="logout-btn">LOGOUT</a>
            </div>
        </aside>

        <main class="content-panel">
            <header class="content-header">
                <h1>Command Center</h1>
            </header>

            <div class="search-workspace">
                <form action="${pageContext.request.contextPath}/dashboard" method="get" class="search-form">
                    <input type="text" name="searchUser" placeholder="Search users by name or email..." value="${param.searchUser}">
                    <button type="submit" class="search-btn">Search</button>
                </form>
            </div>

            <div class="table-container">
                <table class="management-table">
                    <thead>
                        <tr>
                            <th>Username</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th style="text-align: center;">Action</th>
                        </tr>
                    </thead>
                    <%-- Note: No tbody wrapper tags used here to stay synchronized --%>
                    <c:choose>
                        <c:when test="${not empty userList}">
                            <c:forEach var="managedUser" items="${userList}">
                                <tr>
                                    <td class="user-name-cell">${managedUser.username}</td>
                                    <td><span class="role-badge ${managedUser.userRole}">${managedUser.userRole}</span></td>
                                    <td>
                                        <span class="status-indicator ${managedUser.active == 1 ? 'active' : 'inactive'}">
                                            ${managedUser.active == 1 ? 'Active' : 'Inactive'}
                                        </span>
                                    </td>
                                    <td style="text-align: center;">
                                        <form action="${pageContext.request.contextPath}/updateUserStatus" method="post" style="display:inline;">
                                            <input type="hidden" name="userId" value="${managedUser.userId}">
                                            <input type="hidden" name="currentStatus" value="${managedUser.active}">
                                            <c:choose>
                                                <c:when test="${managedUser.active == 1}">
                                                    <button type="submit" class="action-btn deactivate">Deactivate</button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="submit" class="action-btn activate">Activate</button>
                                                </c:otherwise>
                                            </c:choose>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td class="user-name-cell">rubin_admin</td>
                                <td><span class="role-badge admin">admin</span></td>
                                <td><span class="status-indicator active">Active</span></td>
                                <td style="text-align: center;"><button class="action-btn deactivate">Deactivate</button></td>
                            </tr>
                            <tr>
                                <td class="user-name-cell">sunila_kayastha</td>
                                <td><span class="role-badge customer">customer</span></td>
                                <td><span class="status-indicator inactive">Inactive</span></td>
                                <td style="text-align: center;"><button class="action-btn activate">Activate</button></td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </table>
            </div>
        </main>
    </div>

</body>
</html>