<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aboutus.css">
 
    <title>Document</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<main class="about-page">
    <!-- Hero Banner -->
    <section class="about-hero">
        <img src="${pageContext.request.contextPath}/images/croissants_banner.jpg" alt="Bakery Display">
    </section>

    <section class="about-intro">
        <h1>About Us</h1>
        <p class="subtitle">A Journey of Taste and Craftsmanship</p>
        
        <!-- Story Block 1 -->
        <div class="story-block">
            <div class="text-content">
                <p>At Silk & Song, our mission is to bring a refined patisserie experience 
                to Nepal by blending timeless craftsmanship with modern elegance. 
                We are dedicated to creating exceptional desserts using the finest ingredients, 
                while nurturing a culture of quality, creativity, and care. Through our journey, 
                we have contributed to elevating Nepal’s bakery landscape, offering not just products, 
                but memorable experiences that celebrate taste, artistry, and togetherness.</p>
            </div>
            <div class="image-content">
                <img src="${pageContext.request.contextPath}/images/bakery_window.jpg" alt="Bakery Window">
            </div>
        </div>

        <!-- Story Block 2 (Reversed) -->
        <div class="story-block reverse">
            <div class="text-content">
                <p>Building on this vision, Silk & Song is committed to supporting local communities 
                and fostering growth within Nepal’s 
                culinary landscape. We continuously 
                strive to innovate while honoring tradition,
                 creating opportunities for local talent and sourcing quality ingredients responsibly. As we grow, our focus remains on delivering meaningful experiences, where every visit reflects our passion for excellence, attention to detail, 
                and dedication to bringing people together through the art of fine patisserie.</p>
            </div>
            <div class="image-content">
                <img src="${pageContext.request.contextPath}/images/bakery_interior.jpg" alt="Bakery Interior">
            </div>
        </div>
    </section>

    <!-- Quote Divider -->
    <section class="quote-divider">
        <p class="since">Since 2000</p>
        <h3>Sugar & Silk — where sweetness meets elegance, and every detail is delicately crafted.</h3>
    </section>

    <!-- Team Section -->
    <section class="team-section">
        <h2>Our Wonderful Team</h2>
        
        <!-- Team Card -->
        <div class="team-card">
            <img src="${pageContext.request.contextPath}/images/profile_placeholder.png" alt="Suvham Shakya">
            <div class="team-info">
                <h3>Suvham Shakya</h3>
                <p class="role">CEO (Leader) - 24046920</p>
                <br><br>
                <p>Hobbies: <br>Video <br>GamesUI Design <br>Travelling</p>
            </div>
        </div>

       
        <div class="team-card">
            <img src="${pageContext.request.contextPath}/images/profile_placeholder.png" alt="Suvham Shakya">
            <div class="team-info">
                <h3>Shashreek Shrestha</h3>
                <p class="role">Manager - 24046882</p>
                <br><br>
                <p>Hobbies: Footbal<br> UI Design<br> Travelling</p>
            </div>
        </div>

  
        <div class="team-card">
            <img src="${pageContext.request.contextPath}/images/profile_placeholder.png" alt="Suvham Shakya">
            <div class="team-info">
                <h3>Tamanna Aryal</h3>
                <p class="role">CEO (Leader) -  24046929</p>
                <br>
                <p>Hobbies:<br> Skateboarding<br> UI Design<br> Gaming</p>
            </div>
        </div>

      
    </section>
</main>
	
	<%@ include file="footer.jsp" %>
</body>
</html>