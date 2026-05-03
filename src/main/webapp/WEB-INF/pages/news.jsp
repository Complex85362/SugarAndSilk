<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/news.css">
    <title>Document</title>
    
</head>
<body>
	<%@ include file="header.jsp" %>
       <main>
       <section class="news-hero">
       		<div class="hero-overlay">
                <h1>Our News</h1>
            </div>
        </section>

        <section class="news-grid-section">
            <div class="news-grid">
                
                <a href="${pageContext.request.contextPath}/newspage" class="news-card">
                    <div class="card-img-wrapper">
                        <img src="${pageContext.request.contextPath}/images/new-2.jpg" alt="News Image 1">
                    </div>
                    <div class="card-content">
                        <h3>Silk & Song Unveils Its New Signature Collection</h3>
                    </div>
                </a>

                <a href="${pageContext.request.contextPath}/newspage" class="news-card">
                    <div class="card-img-wrapper">
                        <img src="${pageContext.request.contextPath}/images/news-3.jpg" alt="News Image 2">
                    </div>
                    <div class="card-content">
                        <h3>A New Chapter of Elegance Opens in Kathmandu</h3>
                    </div>
                </a>

                <a href="${pageContext.request.contextPath}/newspage" class="news-card">
                    <div class="card-img-wrapper">
                        <img src="${pageContext.request.contextPath}/images/news-4.jpg" alt="News Image 3">
                    </div>
                    <div class="card-content">
                        <h3>Introducing Our Seasonal Patisserie Creations</h3>
                    </div>
                </a>

                <a href="${pageContext.request.contextPath}/newspage" class="news-card">
                    <div class="card-img-wrapper">
                        <img src="${pageContext.request.contextPath}/images/news-5.jpg" alt="News Image 4">
                    </div>
                    <div class="card-content">
                        <h3>Silk & Song Expands with New Store Locations</h3>
                    </div>
                </a>

                <a href="${pageContext.request.contextPath}/newspage" class="news-card">
                    <div class="card-img-wrapper">
                        <img src="${pageContext.request.contextPath}/images/news-6.jpg" alt="News Image 5">
                    </div>
                    <div class="card-content">
                        <h3>Celebrating Craftsmanship: Behind Our Finest Creations</h3>
                    </div>
                </a>

                <a href="${pageContext.request.contextPath}/newspage" class="news-card">
                    <div class="card-img-wrapper">
                        <img src="${pageContext.request.contextPath}/images/news-7.jpg" alt="News Image 6">
                    </div>
                    <div class="card-content">
                        <h3>An Evening of Indulgence: Our Exclusive Dessert Showcase</h3>
                    </div>
                </a>

            </div>
        </section>
    </main>
	<%@ include file="footer.jsp" %>
    
</body>
</html>
</body>
</html>