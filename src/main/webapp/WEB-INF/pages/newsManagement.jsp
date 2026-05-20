<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar & Silk | News Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productManagement.css">
</head>
<body>
<div class="container">

    <div class="sidebar">
        <div class="logo">
        <a href="${pageContext.request.contextPath}/home" class="logo-link">
        S&S <span>Sugar & Silk</span>
        </a></div>

        <ul>
            <li><a href="${pageContext.request.contextPath}/dashboard">Command Center</a></li>
            <li><a href="${pageContext.request.contextPath}/addProduct">Add Product</a></li>
            <li><a href="${pageContext.request.contextPath}/productManagement">Product Management</a></li>
            <li><a href="${pageContext.request.contextPath}/addNews">Add News</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/newsManagement">News Management</a></li>
            <li><a href="${pageContext.request.contextPath}/enquiryManagement">Enquiries</a></li>
        </ul>

        <a href="${pageContext.request.contextPath}/logout" class="logout">LOGOUT</a>
    </div>


    <div class="main">

        <div class="topbar">
            <h2>News Management</h2>
        </div>


        <c:if test="${sessionScope.updateNewsSuccess == true}">
            <div class="alert alert-success">
                <strong>Updated!</strong> The news article has been successfully updated.
            </div>
            <c:remove var="updateNewsSuccess" scope="session"/>
        </c:if>

        <c:if test="${sessionScope.updateNewsError == true}">
            <div class="alert alert-error">
                <strong>Update Failed!</strong> Something went wrong. Please try again.
            </div>
            <c:remove var="updateNewsError" scope="session"/>
        </c:if>

        <c:if test="${sessionScope.deleteNewsSuccess == true}">
            <div class="alert alert-success">
                <strong>Deleted!</strong> The news article has been removed.
            </div>
            <c:remove var="deleteNewsSuccess" scope="session"/>
        </c:if>

        <c:if test="${sessionScope.deleteNewsError == true}">
            <div class="alert alert-error">
                <strong>Delete Failed!</strong> Could not find that article or a database error occurred.
            </div>
            <c:remove var="deleteNewsError" scope="session"/>
        </c:if>

        <%-- News table --%>
        <div class="section">
            <h3>All News Articles</h3>

            <c:choose>
                <c:when test="${empty newsList}">
                    <p class="empty-msg">No news articles have been published yet.</p>
                </c:when>
                <c:otherwise>
                    <div class="table-wrapper">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>Image</th>
                                    <th>Published</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="n" items="${newsList}">
                                    <tr>
                                        <td>${n.newsId}</td>
                                        <td>${n.title}</td>
                                        <td>
                                            <img src="${pageContext.request.contextPath}/images/${n.imagePath}"
                                                 alt="${n.title}"
                                                 style="width:60px;height:40px;object-fit:cover;border-radius:6px;">
                                        </td>
                                        <td>${n.publishDate}</td>
                                        <td class="action-cell">

                                            <%-- UPDATE --%>
                                            <a href="${pageContext.request.contextPath}/updateNews?id=${n.newsId}"
                                               class="btn-update"
                                               style="text-decoration:none;display:inline-block;
                                                      padding:6px 14px;border-radius:8px;
                                                      background:#C5A059;color:white;font-size:13px;">
                                                Update
                                            </a>

                                            <%-- DELETE --%>
                                            <form action="${pageContext.request.contextPath}/newsManagement"
                                                  method="post"
                                                  style="display:inline;">
                                                <input type="hidden" name="_method" value="DELETE">
                                                <input type="hidden" name="News_id" value="${n.newsId}">
                                                <button type="submit" class="btn-delete"
                                                        onclick="return confirm('Delete &quot;${n.title}&quot;? This cannot be undone.');">
                                                    Delete
                                                </button>
                                            </form>

                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

    </div>
</div>
</body>
</html>
