<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar &amp; Silk | Product Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productManagement.css">
</head>
<body>
<div class="container">

    <!-- SIDEBAR -->
    <div class="sidebar">
        <div class="logo">
        <a href="${pageContext.request.contextPath}/home" class="logo-link">
        S&S <span>Sugar & Silk</span>
        </a></div>

        <ul>
            <li><a href="${pageContext.request.contextPath}/dashboard">Command Center</a></li>
            <li><a href="${pageContext.request.contextPath}/addProduct">Add Product</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/productManagement">Product Management</a></li>
            <li><a href="${pageContext.request.contextPath}/addNews">Add News</a></li>
            <li><a href="${pageContext.request.contextPath}/newsManagement">News Management</a></li>
            <li><a href="${pageContext.request.contextPath}/enquiryManagement">Enquiries</a></li>
        </ul>

        <button class="logout">LOGOUT</button>
    </div>

    <!-- MAIN -->
    <div class="main">

        <!-- TOP BAR -->
        <div class="topbar">
            <h2>Product Management</h2>
        </div>

        <!-- FLASH MESSAGES - Using Session Attributes -->
        
        <!-- Update Success -->
        <c:if test="${sessionScope.updateSuccess == true}">
            <div class="alert alert-success">
                <strong>Updated!</strong> The product has been successfully updated.
            </div>
            <c:set var="dummy" value="${sessionScope.remove('updateSuccess')}" scope="session"/>
        </c:if>

        <!-- Delete Success -->
        <c:if test="${sessionScope.deleteSuccess == true}">
            <div class="alert alert-success">
                <strong>Deleted!</strong> The product has been removed from the inventory.
            </div>
            <c:set var="dummy" value="${sessionScope.remove('deleteSuccess')}" scope="session"/>
        </c:if>

        <!-- Delete Error -->
        <c:if test="${sessionScope.deleteError == true}">
            <div class="alert alert-error">
                <strong>Delete Failed!</strong> Could not find that product or a database error occurred.
            </div>
            <c:set var="dummy" value="${sessionScope.remove('deleteError')}" scope="session"/>
        </c:if>

        <!-- General Error -->
        <c:if test="${sessionScope.error == true}">
            <div class="alert alert-error">
                <strong>Error!</strong> Something went wrong. Please try again.
            </div>
            <c:set var="dummy" value="${sessionScope.remove('error')}" scope="session"/>
        </c:if>

        <!-- Product Not Found -->
        <c:if test="${sessionScope.notFound == true}">
            <div class="alert alert-error">
                <strong>Not Found!</strong> No product exists with that ID.
            </div>
            <c:set var="dummy" value="${sessionScope.remove('notFound')}" scope="session"/>
        </c:if>

        <!-- PRODUCT TABLE -->
        <div class="section">
            <h3>All Products</h3>

            <c:choose>
                <c:when test="${empty productList}">
                    <p class="empty-msg">No products found in the inventory.</p>
                </c:when>
                <c:otherwise>
                    <div class="table-wrapper">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Stock</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="p" items="${productList}">
                                    <tr>
                                        <td>${p.productId}</td>
                                        <td>${p.productName}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${p.categoryId == 1}">Artisan Cakes</c:when>
                                                <c:when test="${p.categoryId == 2}">Daily Bread</c:when>
                                                <c:when test="${p.categoryId == 3}">Bakery Events</c:when>
                                                <c:when test="${p.categoryId == 4}">Flash Sales</c:when>
                                                <c:otherwise>Category ${p.categoryId}</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>$${p.productPrice}</td>
                                        <td>
                                            <span class="${p.stockQuantity > 20 ? 'stock-ok' : p.stockQuantity > 0 ? 'stock-low' : 'stock-out'}">
                                                ${p.stockQuantity}
                                            </span>
                                        </td>
                                        <td class="action-cell">
                                            <!-- UPDATE BUTTON: Sets session attribute and goes to GET /updateProduct -->
                                            <form action="${pageContext.request.contextPath}/updateProduct"  method="post" style="display:inline;">
                                                <input type="hidden" name="setSessionId" value="${p.productId}">
                                                <button type="submit" class="btn-update">Update</button>
                                            </form>

                                            <!-- DELETE BUTTON: POST with _method=DELETE (no query string) -->
                                            <form action="${pageContext.request.contextPath}/productManagement" method="post" style="display:inline;" onsubmit="return confirm('Delete &quot;${p.productName}&quot;? This cannot be undone.');">
                                                <input type="hidden" name="_method"    value="DELETE">
                                                <input type="hidden" name="Product_ID" value="${p.productId}">
                                                <button type="submit" class="btn-delete">Delete</button>
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
