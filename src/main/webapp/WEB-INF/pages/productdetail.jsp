<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productdetail.css">
    <title>Document</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<main class="product-container">
        <!-- Back Button (pointing to the Product Servlet) -->
        <a href="${pageContext.request.contextPath}/product" class="back-link">
            Go Back
        </a>

        <div class="product-wrapper">
            
            <!-- Left Side: Images -->
            <div class="image-gallery">
                <div class="main-img">
                    <img src="${pageContext.request.contextPath}/images/tiramisu.jpg" alt="Tiramisu - Mains">
                </div>
                <!-- Thumbnail images statically linked for now -->
                <div class="thumbnail-group">
                    <img src="${pageContext.request.contextPath}/images/tiramisu.jpg" alt="Tiramisu serving" class="thumb active">
                    <img src="${pageContext.request.contextPath}/images/tiramisu.jpg" alt="Tiramisu serving 2" class="thumb">
                    <img src="${pageContext.request.contextPath}/images/tiramisu.jpg" alt="Tiramisu close-up" class="thumb">
                </div>
            </div>

            <!-- Right Side: Details -->
            <div class="product-data">
                <h1 class="product-title">Tiramisu</h1>
                <p class="product-description">
                    A classic Italian dessert reimagined with refined elegance, our tiramisu features delicate layers of espresso-soaked sponge and velvety mascarpone cream, finished with a light dusting of cocoa.
                </p>
                <p class="product-price">Rs. 650</p>

               <!-- cart sections -->
                <div class="cart-actions">
                    <div class="qty-selector">
                        <button class="qty-btn minus">-</button>
                        <input type="number" value="1" min="1" class="qty-input">
                        <button class="qty-btn plus">+</button>
                    </div>
                    <button class="add-to-cart-btn">Add to Cart</button>
                </div>

                <div class="ingredients">
                    <p>Ingredients: Mascarpone cheese, fresh cream, eggs, sugar, ladyfinger biscuits (savoirardi), espresso coffee, cocoa powder, vanilla extract</p>
                </div>
            </div>

        </div>
    </main>
	<%@ include file="footer.jsp" %>
</body>
</html>