<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<header class="navbar">
    <div class="logo">
        <a href="${pageContext.request.contextPath}/home">
            <img src="${pageContext.request.contextPath}/images/A_logo_for_a_company_named_Sugar___Silk__make_the_font_PlayFair_Display__also_make_sure_that_there_is_some_design_Between_the___and_Silk-removebg-preview.png" alt="Company_logo">
        </a>
    </div>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/product">E-Shop</a>
        <a href="${pageContext.request.contextPath}/location">Our Stores</a>
        <a href="${pageContext.request.contextPath}/aboutus">About Us</a>
        <a href="${pageContext.request.contextPath}/news">News</a>
    </div>
    <div class="nav-actions">
        <a href="${pageContext.request.contextPath}/profile">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="nav-icon">
                <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path>
                <circle cx="12" cy="7" r="4"></circle>
            </svg>
        </a>

        <a href="${pageContext.request.contextPath}/cart" id="cart-icon-link" style="position: relative; display: inline-flex; align-items: center;">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="nav-icon">
                <circle cx="9" cy="21" r="1"></circle>
                <circle cx="20" cy="21" r="1"></circle>
                <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
            </svg>
            
            <c:choose>
    <c:when test="${not empty sessionScope.user && not empty sessionScope.cartCount && sessionScope.cartCount > 0}">
        <span id="cart-badge" class="navbar-cart-badge">${sessionScope.cartCount}</span>
    </c:when>
    <c:otherwise>
        <span id="cart-badge" class="navbar-cart-badge">0</span>
    </c:otherwise>
</c:choose>
        </a>
    </div>
</header>

<style>
.navbar-cart-badge {
    position: absolute;
    top: -6px;
    right: -8px;
    background-color: var(--gold, #C2A46F);
    color: #ffffff !important;
    font-family: 'Poppins', sans-serif;
    font-size: 11px;
    font-weight: 700;
    line-height: 1;
    text-align: center;
    padding: 3px 6px;
    border-radius: 10px;
    min-width: 18px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.15);
}
</style>