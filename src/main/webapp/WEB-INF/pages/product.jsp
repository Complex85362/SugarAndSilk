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
        <header class="collection-header">
        <section class="product-hero">
        <img src="${pageContext.request.contextPath}/images/product_banner.jpg" alt="Bakery Display">
    	</section>
            <h1>Enjoy Our Product Collection</h1>
            <p class="availability">Available for pickup and delivery through our various locations across Kathmandu</p>
        </header>

        <div class="product-grid"> 
            <c:forEach var="item" items="${productList}">
                <div class="product-card">
                    <div class="image-container">
                        <!-- item.productImage pulls the filename from the database -->
                        <img src="${pageContext.request.contextPath}/images/${item.productImage}" 
					     alt="${item.productName}" 
					     onerror="this.src='${pageContext.request.contextPath}/images/macarons.jpg';">
                            <button class="add-btn">Add to Cart</button>
                      </div>
                    <div class="product-details">
                        <a href="${pageContext.request.contextPath}/detail"><h3 class="product-title">${item.productName}</h3></a>
						<a href="${pageContext.request.contextPath}/detail"><p class="product-price">Rs. ${item.productPrice}</p></a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </main>
	
	
	
	<%@ include file="footer.jsp" %>
</body>
</html>