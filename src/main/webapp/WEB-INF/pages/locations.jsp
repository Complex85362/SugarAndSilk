<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/locations.css">
</head>
<body>
	<%@ include file="header.jsp" %>
	<main class="locations-page">
    <h1>Sugar & Silk Locations</h1>

    <!-- Location 1: Kumaripati -->
    <section class="location-card">
        <div class="image-content">
            <img src="${pageContext.request.contextPath}/images/kumaripati.jpg" alt="Kumaripati Branch">
        </div>
        <div class="text-content">
            <h2>Kumaripati</h2>
            <p class="address">Kumaripati, Lalitpur</p>
            <p class="phone">Number : 9800000000</p>
            
            <div class="hours-block">
                <p class="label">Opening Hours</p>
                <p>Sunday - Friday<br>8 AM to 7 PM</p>
                <p>Saturday<br>8 AM to 9 PM</p>
            </div>
        </div>
    </section>

    <!-- Location 2: Kumari Hall (Reversed) -->
    <section class="location-card reverse">
        <div class="image-content">
            <img src="${pageContext.request.contextPath}/images/kumari-hall.jpg" alt="Kumari Hall Branch">
        </div>
        <div class="text-content">
            <h2>Kumari Hall</h2>
            <p class="address">Kumari Hall, Kathmandu</p>
            <p class="phone">Number : 9800000000</p>
            
            <div class="hours-block">
                <p class="label">Opening Hours</p>
                <p>Sunday - Friday<br>8 AM to 7 PM</p>
                <p>Saturday<br>8 AM to 9 PM</p>
            </div>
        </div>
    </section>

    <!-- Location 3: Labim Mall -->
    <section class="location-card">
        <div class="image-content">
            <img src="${pageContext.request.contextPath}/images/labim_mall.jpg" alt="Labim Mall Branch">
        </div>
        <div class="text-content">
            <h2>Labim Mall</h2>
            <p class="address">Pulchowk, Lalitpur</p>
            <p class="phone">Number : 9800000000</p>
            
            <div class="hours-block">
                <p class="label">Opening Hours</p>
                <p>Sunday - Friday<br>8 AM to 7 PM</p>
                <p>Saturday<br>8 AM to 9 PM</p>
            </div>
        </div>
    </section>

    <!-- Location 4: Durbar Marg (Reversed) -->
    <section class="location-card reverse">
        <div class="image-content">
            <img src="${pageContext.request.contextPath}/images/durbar_marg.jpg" alt="Durbar Marg Branch">
        </div>
        <div class="text-content">
            <h2>Durbar Marg</h2>
            <p class="address">Durbar Marg, Kathmandu</p>
            <p class="phone">Number : 9800000000</p>
            
            <div class="hours-block">
                <p class="label">Opening Hours</p>
                <p>Sunday - Friday<br>8 AM to 7 PM</p>
                <p>Saturday<br>8 AM to 9 PM</p>
            </div>
        </div>
    </section>
</main>
	<%@ include file="footer.jsp" %>
</body>
</html>