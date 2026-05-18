<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link class="fluid-css" rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link class="fluid-css" rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link class="fluid-css" rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css">
    <title>Sugar & Silk | Collection</title>
    <style>
        /* This completely hides the frame from your design layout view */
        .silent-frame {
            display: none;
            width: 0;
            height: 0;
            border: none;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <iframe name="hidden_frame" class="silent-frame"></iframe>

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
                        <img src="${pageContext.request.contextPath}/images/${item.productImage}" 
                             alt="${item.productName}" 
                             onerror="this.src='${pageContext.request.contextPath}/images/macarons.jpg';">
                        
                        <form action="${pageContext.request.contextPath}/cart" method="POST" target="hidden_frame">
                            <input type="hidden" name="productId" value="${item.productId}">
                            <input type="hidden" name="quantity" value="1">
                            <button type="submit" class="add-btn">Add to Cart</button>
                        </form>
                    </div>
                    <div class="product-details">
                        <a href="${pageContext.request.contextPath}/detail?id=${item.productId}">
                            <h3 class="product-title">${item.productName}</h3>
                        </a>
                        <a href="${pageContext.request.contextPath}/detail?id=${item.productId}">
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