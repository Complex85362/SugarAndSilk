<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <div class="item-card">
                    <img src="${pageContext.request.contextPath}/images/tiramisu.jpg" alt="Tiramisu">
                    <div class="item-details">
                        <h3>Tiramisu</h3>
                        <p class="price">Rs. 650</p>
                        <div class="quantity-selector">
                            <button>-</button>
                            <input type="text" value="1" readonly>
                            <button>+</button>
                        </div>
                    </div>
                </div>

                <div class="item-card">
                    <img src="${pageContext.request.contextPath}/images/donut.jpg" alt="Donut">
                    <div class="item-details">
                        <h3>Donut</h3>
                        <p class="price">Rs. 200</p>
                        <div class="quantity-selector">
                            <button>-</button>
                            <input type="text" value="1" readonly>
                            <button>+</button>
                        </div>
                    </div>
                </div>
            </div>

            <aside class="summary-box">
                <h2>Summary</h2>
                <div class="summary-row">
                    <span>Sub Total</span>
                    <span>Rs. 1500</span>
                </div>
                <div class="summary-row">
                    <span>Taxes</span>
                    <span>Rs. 150</span>
                </div>
                <div class="summary-total">
                    <span>Total</span>
                    <span>Rs. 1650</span>
                </div>
                <button class="checkout-btn">Proceed to Checkout</button>
            </aside>
        </div>
    </main>

    <%@ include file="footer.jsp" %>

</body>
</html>