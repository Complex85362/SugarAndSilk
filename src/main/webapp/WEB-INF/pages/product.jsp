<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css">
    <title>Document</title>

</head>
<body>
	<%@ include file="header.jsp" %>
	<main class="product-collection">

        <%-- Hero banner at the top of the product page --%>
        <section class="product-hero">
            <img src="${pageContext.request.contextPath}/images/product_banner.jpg"
                 alt="Sugar and Silk Bakery Display">
        </section>

        <header class="collection-header">
            <h1>Enjoy Our Product Collection</h1>
            <p class="availability">
                Available for pickup and delivery through our various locations across Kathmandu
            </p>
        </header>

        <%-- If the servlet could not load products, show a message --%>
        <c:if test="${not empty errorMessage}">
            <p class="error-msg">${errorMessage}</p>
        </c:if>

        <%-- If the product list is empty (no error but nothing in DB) --%>
        <c:if test="${empty productList and empty errorMessage}">
            <p class="error-msg">No products are available at the moment. Please check back soon.</p>
        </c:if>

        <%-- Dynamic product grid --%>
        <div class="product-grid">
            <c:forEach var="item" items="${productList}">
                <div class="product-card">

                    
                    <a href="${pageContext.request.contextPath}/detail?id=${item.productId}"
                       class="card-image-link">
                        <div class="image-container">
                            <img src="${pageContext.request.contextPath}/images/${item.productImage}"
                                 alt="${item.productName}">
                            <span class="add-btn">Add to cart</span>
                        </div>
                    </a>

                    <div class="product-details">
                        <a href="${pageContext.request.contextPath}/detail?productId=${item.productId}">
                            <h3 class="product-title">${item.productName}</h3>
                        </a>
                        <a href="${pageContext.request.contextPath}/detail?productId=${item.productId}">
                            <p class="product-price">Rs. ${item.productPrice}</p>
                        </a>
                    </div>

                </div>
            </c:forEach>
        </div>

    </main>

	
	
	<%@ include file="footer.jsp" %>
</body>
</html>