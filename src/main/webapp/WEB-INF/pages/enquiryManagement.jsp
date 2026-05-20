<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar & Silk | Enquiry Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dashboard.css?v=4.6">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/enquiryManagement.css?v=4.6">
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
                <a href="${pageContext.request.contextPath}/newsManagement" class="menu-item">News Management</a>
                <a href="${pageContext.request.contextPath}/enquiryManagement" class="menu-item active">Enquiries</a>
            </nav>
            
            <div class="sidebar-footer">
                <a href="${pageContext.request.contextPath}/logout" class="logout-btn">LOGOUT</a>
            </div>
        </aside>

        <main class="content-panel">

            <header class="content-header">
                <h1>Customer Enquiries</h1>
            </header>

            <c:if test="${not empty errorMessage}">
                <div class="alert alert-error">
                    <strong>Error!</strong> ${errorMessage}
                </div>
            </c:if>

            <div class="table-container">
                <h3>All Enquiries</h3>

                <c:choose>
                    <c:when test="${empty enquiryList}">
                        <p class="empty-msg">No enquiries have been submitted yet.</p>
                    </c:when>
                    <c:otherwise>
                        <table class="management-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Subject</th>
                                    <th>Message</th>
                                    <th>Submitted</th>
                                </tr>
                            </thead>
                            
                            <%-- FIX: Strictly avoiding tbody wrapper tag to eliminate template compiler mismatch bugs --%>
                            <c:forEach var="enquiry" items="${enquiryList}">
                                <tr>
                                    <td><strong>#${enquiry.enquiryId}</strong></td>
                                    <td class="user-name-cell">${enquiry.firstName} ${enquiry.lastName}</td>
                                    <td class="email-cell">${enquiry.email}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty enquiry.phone}">
                                                ${enquiry.phone}
                                            </c:when>
                                            <c:otherwise>
                                                <span class="null-dash">—</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="subject-cell">
                                        <c:choose>
                                            <c:when test="${not empty enquiry.subject}">
                                                ${enquiry.subject}
                                            </c:when>
                                            <c:otherwise>
                                                <span class="null-dash">—</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="message-cell">
                                        <c:choose>
                                            <c:when test="${not empty enquiry.message}">
                                                ${enquiry.message}
                                            </c:when>
                                            <c:otherwise>
                                                <span class="null-dash">—</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="date-cell">${enquiry.submittedAt}</td>
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