<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar & Silk | Your Cart</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&family=Poppins:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart.css">
</head>
<body>

    <%@ include file="header.jsp" %>

    <main>
        <h1 class="cart-title">Your Cart</h1>
        
        <div class="cart-container">
            <div class="cart-items">
                <c:choose>
                    <c:when test="${empty cartItems}">
                        <div class="empty-cart-message">
                            <p>Your shopping cart is currently empty.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="item" items="${cartItems}">
                            <div class="item-card">
                                <img src="${pageContext.request.contextPath}/images/${item.imageUrl}" alt="${item.productName}">
                                
                                <div class="item-details">
                                    <h3>${item.productName}</h3>
                                    <p class="price">Rs. ${item.productPrice}</p>
                                    
                                    <form action="${pageContext.request.contextPath}/cart" method="POST" style="display:inline;">
                                        <input type="hidden" name="productId" value="${item.productId}">
                                        <input type="hidden" name="action" value="delete">
                                        <button type="submit" style="background:none; border:none; color:#ba3c3c; cursor:pointer; font-size:13px; margin-top:8px; display:block; padding:0;">Remove Item</button>
                                    </form>
                                </div>
                                
                                <div class="quantity-selector">
    <form action="${pageContext.request.contextPath}/cart" method="POST">
        <input type="hidden" name="productId" value="${item.productId}">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="quantity" value="${item.quantity - 1}">
        <button type="submit" class="minus-btn" ${item.quantity <= 1 ? 'disabled' : ''}>-</button>
    </form>

    <span class="qty-display">${item.quantity}</span>

    <form action="${pageContext.request.contextPath}/cart" method="POST">
        <input type="hidden" name="productId" value="${item.productId}">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="quantity" value="${item.quantity + 1}">
        <button type="submit" class="plus-btn">+</button>
    </form>
</div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

            <aside class="summary-box">
			    <h2>Summary</h2>
			    <div class="summary-row">
			        <span>Sub Total</span>
			        <span id="summary-subtotal">Rs. ${not empty subTotal ? subTotal : '0.00'}</span>
			    </div>
			    <div class="summary-row">
			        <span>Taxes (10%)</span>
			        <span id="summary-taxes">Rs. ${not empty taxes ? taxes : '0.00'}</span>
			    </div>
			    <div class="summary-total">
			        <span>Total</span>
			        <span id="summary-total">Rs. ${not empty total ? total : '0.00'}</span>
			    </div>
			    
			    <form action="${pageContext.request.contextPath}/checkout" method="POST">
			        <input type="hidden" name="checkoutTotal" value="${total}">
			        <button type="submit" class="checkout-btn">Proceed to Checkout</button>
			    </form>
			</aside>
        </div>
    </main>

    <%@ include file="footer.jsp" %>

</body>
</html>