<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar & Silk | Enquiry Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productManagement.css">
</head>
<body>
<div class="container">

    <%-- SIDEBAR --%>
    <div class="sidebar">
        <div class="logo">
            <a href="${pageContext.request.contextPath}/home" class="logo-link">
                S&amp;S <span>Sugar &amp; Silk</span>
            </a>
        </div>
        <ul>
            <li><a href="${pageContext.request.contextPath}/dashboard">Command Center</a></li>
            <li><a href="${pageContext.request.contextPath}/addProduct">Add Product</a></li>
            <li><a href="${pageContext.request.contextPath}/productManagement">Product Management</a></li>
            <li><a href="${pageContext.request.contextPath}/addNews">Add News</a></li>
            <li><a href="${pageContext.request.contextPath}/newsManagement">News Management</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/enquiryManagement">Enquiries</a></li>
        </ul>
        <a href="${pageContext.request.contextPath}/logout" class="logout">LOGOUT</a>
    </div>

    <%-- MAIN --%>
    <div class="main">

        <div class="topbar">
            <h2>Customer Enquiries</h2>
        </div>

        <c:if test="${not empty errorMessage}">
            <div class="alert alert-error">
                <strong>Error!</strong> ${errorMessage}
            </div>
        </c:if>

        <%-- ENQUIRY TABLE --%>
        <div class="section">
            <h3>All Enquiries</h3>

            <c:choose>
                <c:when test="${empty enquiryList}">
                    <p class="empty-msg">No enquiries have been submitted yet.</p>
                </c:when>
                <c:otherwise>
                    <div class="table-wrapper">
                        <table>
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
                            <tbody>
                                <c:forEach var="enquiry" items="${enquiryList}">
                                    <tr>
                                        <td>${enquiry.enquiryId}</td>
                                        <td>${enquiry.firstName} ${enquiry.lastName}</td>
                                        <td>${enquiry.email}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty enquiry.phone}">
                                                    ${enquiry.phone}
                                                </c:when>
                                                <c:otherwise>
                                                    <span style="color:#bbb;">—</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty enquiry.subject}">
                                                    ${enquiry.subject}
                                                </c:when>
                                                <c:otherwise>
                                                    <span style="color:#bbb;">—</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td style="max-width:280px;white-space:normal;word-break:break-word;">
                                            <c:choose>
                                                <c:when test="${not empty enquiry.message}">
                                                    ${enquiry.message}
                                                </c:when>
                                                <c:otherwise>
                                                    <span style="color:#bbb;">—</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td style="white-space:nowrap;">${enquiry.submittedAt}</td>
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
