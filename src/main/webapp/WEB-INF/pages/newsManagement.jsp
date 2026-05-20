<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar & Silk | News Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dashboard.css?v=4.6">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/newsManagement.css?v=4.6">
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
                <a href="${pageContext.request.contextPath}/dashboard" class="menu-item">Command Center</a>
                <a href="${pageContext.request.contextPath}/addProduct" class="menu-item">Add Product</a>
                <a href="${pageContext.request.contextPath}/productManagement" class="menu-item">Product Management</a>
                <a href="${pageContext.request.contextPath}/addNews" class="menu-item">Add News</a>
                <a href="${pageContext.request.contextPath}/newsManagement" class="menu-item active">News Management</a>
                <a href="${pageContext.request.contextPath}/enquiryManagement" class="menu-item">Enquiries</a>
            </nav>
            
            <div class="sidebar-footer">
                <a href="${pageContext.request.contextPath}/logout" class="logout-btn">LOGOUT</a>
            </div>
        </aside>

        <main class="content-panel">
            <header class="content-header">
                <h1>News Management</h1>
            </header>

            <c:if test="${sessionScope.updateNewsSuccess == true}">
                <div class="alert alert-success">
                    <strong>Updated!</strong> The news article has been successfully updated.
                </div>
                <c:remove var="updateNewsSuccess" scope="session"/>
            </c:if>
            <c:if test="${sessionScope.deleteNewsSuccess == true}">
                <div class="alert alert-success">
                    <strong>Deleted!</strong> The news article has been removed.
                </div>
                <c:remove var="deleteNewsSuccess" scope="session"/>
            </c:if>

            <div class="table-container">
                <h3>All News Articles</h3>
                <c:choose>
                    <c:when test="${empty newsList}">
                        <p class="empty-msg">No news articles have been published yet.</p>
                    </c:when>
                    <c:otherwise>
                        <table class="management-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>Image</th>
                                    <th>Published Date</th>
                                    <th style="text-align: center;">Actions</th>
                                </tr>
                            </thead>
                            <%-- Note: Strictly avoiding tbody wrapper tags to prevent compiler mismatch errors --%>
                            <c:forEach var="n" items="${newsList}">
                                <tr>
                                    <td><strong>#${n.newsId}</strong></td>
                                    <td class="news-title-cell">${n.title}</td>
                                    <td>
                                        <img src="${pageContext.request.contextPath}/images/${n.imagePath}" alt="${n.title}" class="news-thumbnail">
                                    </td>
                                    <td class="date-cell">${n.publishDate}</td>
                                    <td class="action-cell">
                                        <a href="${pageContext.request.contextPath}/updateNews?id=${n.newsId}" class="action-btn btn-update">
                                            Update
                                        </a>
                                        <form action="${pageContext.request.contextPath}/newsManagement" method="post" style="display:inline;">
                                            <input type="hidden" name="_method" value="DELETE">
                                            <input type="hidden" name="News_id" value="${n.newsId}">
                                            <button type="submit" class="action-btn btn-delete" onclick="return confirm('Delete &quot;${n.title}&quot;? This cannot be undone.');">
                                                Delete
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:otherwise>
                </c:choose>
            </div>
        </main>
    </div>

</body>
</html>