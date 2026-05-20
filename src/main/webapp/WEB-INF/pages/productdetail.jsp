<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Sugar &amp; Silk | Product Detail</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productdetail.css?v=2.5">
</head>
<body>

    <%@ include file="header.jsp" %>

    <main class="product-container">

        <a href="${pageContext.request.contextPath}/product" class="back-link">
            &larr; Back to Products
        </a>

        <div class="product-wrapper">

            <!-- LEFT SIDE IMAGE -->
			<div class="image-gallery">
			    <div class="main-img">
			        <img src="${pageContext.request.contextPath}/images/${product.productImage}"
			             alt="${product.productName}"
			             onerror="this.src='${pageContext.request.contextPath}/images/macarons.jpg'">
			    </div>
			</div>
			
			<!-- RIGHT SIDE PRODUCT DETAILS -->
			<div class="product-data">
			
			    <h1 class="product-title">${product.productName}</h1>
			
			    <p class="product-description">${product.productDescription}</p>
			
			    <p class="product-price">Rs. ${product.productPrice}</p>
			
			    <p class="stock-available">In Stock — ${product.stockQuantity} available</p>
			
			   <div class="cart-actions">
                    <form id="addToCartForm" action="${pageContext.request.contextPath}/cart" method="post" class="cart-form-inline">
			
                        <input type="hidden" name="productId" value="${product.productId}">
                        <input type="hidden" name="productName" value="${product.productName}">
                        <input type="hidden" name="productPrice" value="${product.productPrice}">
			
                        <div class="qty-selector">
                            <button type="button" class="qty-btn minus" onclick="decrementQty()">-</button>
                            <input type="number" id="detailQty" name="quantity" value="1" min="1" max="${product.stockQuantity}" class="qty-input" readonly>
                            <button type="button" class="qty-btn plus" onclick="incrementQty()">+</button>
                        </div>
			
                        <button type="submit" class="add-to-cart-btn">Add to Cart</button>
			
			        </form>
			    </div>
			</div>

        </div>

        <!-- REVIEW SECTION -->
        <section class="review-section">

            <h2>Customer Reviews</h2>
            <c:if test="${param.error == 'invalidReview'}">
			    <p style="color: red; margin-bottom: 15px;">
			        Invalid review input.
			    </p>
			</c:if>
			<c:if test="${param.error == 'reviewFailed'}">
			    <p style="color: red; margin-bottom: 15px;">Failed to submit review. Please try again.</p>
			</c:if>
			
			<c:if test="${not empty sessionScope.reviewSuccess}">
			    <p style="color: green; margin-bottom: 15px;">${sessionScope.reviewSuccess}</p>
			    <c:remove var="reviewSuccess" scope="session"/>
			</c:if>
            <!-- REVIEW FORM -->
            <div class="review-form-container">

                <form action="${pageContext.request.contextPath}/submitReview"
                      method="post"
                      class="review-form">

                    <!-- Placeholder product ID -->
                    <input type="hidden" name="productId" value="${product.productId}">

                    <div class="rating-group">
                        <label for="rating">Your Rating:</label>

                        <select name="rating" id="rating" required>
                            <option value="" disabled selected>Select 1 – 5</option>

                            <c:forEach var="i" begin="1" end="5">
                                <option value="${i}">${i}</option>
                            </c:forEach>

                        </select>
                    </div>

                    <div class="message-group">
                        <textarea name="comment"
                                  placeholder="Share your thoughts about this product..."
                                  rows="5"
                                  required></textarea>
                    </div>

                    <button type="submit" class="submit-review-btn">
                        Submit Review
                    </button>

                </form>

            </div>

			<div class="review-list">
			
			    <c:choose>
			
			        <c:when test="${not empty reviews}">
			
			            <c:forEach var="review" items="${reviews}">
			
			                <div class="review-card">
			
			                    <h4>${review.username}</h4>
			
			                    <p>Rating: ${review.rating}/5</p>
			
			                    <p>${review.comment}</p>
			
			                </div>
			
			            </c:forEach>
			
			        </c:when>
			
			        <c:otherwise>
			
			            <p>No reviews yet.</p>
			
			        </c:otherwise>
			
			    </c:choose>
			
			</div>

        </section>

    </main>

    <%@ include file="footer.jsp" %>
	 <script>
        function incrementQty() {
            const input = document.getElementById('detailQty');
            const max = parseInt(input.getAttribute('max')) || 999;
            let val = parseInt(input.value) || 1;
            if (val < max) {
                input.value = val + 1;
            }
        }

        function decrementQty() {
            const input = document.getElementById('detailQty');
            let val = parseInt(input.value) || 1;
            if (val > 1) {
                input.value = val - 1;
            }
        }
    </script>
</body>
</html>