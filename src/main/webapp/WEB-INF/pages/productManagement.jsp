<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar &amp; Silk | Product Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dashboard.css?v=4.6">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/productManagement.css?v=4.6">
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
                <a href="${pageContext.request.contextPath}/productManagement" class="menu-item active">Product Management</a>
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
                <h1>Product Management</h1>
            </header>

            <%-- Flash Alerts Feedback Systems --%>
            <c:if test="${sessionScope.updateSuccess == true}">
                <div class="alert alert-success">
                    <strong>Updated!</strong> The product has been successfully updated.
                </div>
                <c:set var="dummy" value="${sessionScope.remove('updateSuccess')}" scope="session"/>
            </c:if>
            <c:if test="${sessionScope.deleteSuccess == true}">
                <div class="alert alert-success">
                    <strong>Deleted!</strong> The product has been removed from the inventory.
                </div>
                <c:set var="dummy" value="${sessionScope.remove('deleteSuccess')}" scope="session"/>
            </c:if>
            <c:if test="${sessionScope.deleteError == true}">
                <div class="alert alert-error">
                    <strong>Delete Failed!</strong> Could not find that product or a database error occurred.
                </div>
                <c:set var="dummy" value="${sessionScope.remove('deleteError')}" scope="session"/>
            </c:if>

            <div class="table-container">
                <h3>All Products</h3>
                <c:choose>
                    <c:when test="${empty productList}">
                        <p class="empty-msg">No products found in the inventory.</p>
                    </c:when>
                    <c:otherwise>
                        <table class="management-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Stock</th>
                                    <th style="text-align: center;">Actions</th>
                                </tr>
                            </thead>
                            <%-- Note: No tbody wrappers used here to ensure stable compilation --%>
                            <c:forEach var="p" items="${productList}">
                                <tr>
                                    <td><strong>#${p.productId}</strong></td>
                                    <td class="product-name-cell">${p.productName}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${p.categoryId == 1}">Artisan Cakes</c:when>
                                            <c:when test="${p.categoryId == 2}">Daily Bread</c:when>
                                            <c:when test="${p.categoryId == 3}">Bakery Events</c:when>
                                            <c:when test="${p.categoryId == 4}">Flash Sales</c:when>
                                            <c:otherwise>Category ${p.categoryId}</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="price-cell">$${p.productPrice}</td>
                                    <td>
                                        <span class="stock-badge ${p.stockQuantity > 20 ? 'stock-ok' : p.stockQuantity > 0 ? 'stock-low' : 'stock-out'}">
                                            ${p.stockQuantity}
                                        </span>
                                    </td>
                                    <td class="action-cell">
                                        <form action="${pageContext.request.contextPath}/updateProduct" method="post" style="display:inline;">
                                            <input type="hidden" name="setSessionId" value="${p.productId}">
                                            <button type="submit" class="action-btn btn-update">Update</button>
                                        </form>
                                        <form action="${pageContext.request.contextPath}/productManagement" method="post" style="display:inline;" onsubmit="return confirm('Delete &quot;${p.productName}&quot;? This cannot be undone.');">
                                            <input type="hidden" name="_method" value="DELETE">
                                            <input type="hidden" name="Product_ID" value="${p.productId}">
                                            <button type="submit" class="action-btn btn-delete">Delete</button>
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