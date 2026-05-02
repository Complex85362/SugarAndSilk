<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
       <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <title>Document</title>
</head>
<body>
    <nav>
        <div class="home-page-banner">
        <header class="navbar">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/images/A_logo_for_a_company_named_Sugar___Silk__make_the_font_PlayFair_Display__also_make_sure_that_there_is_some_design_Between_the___and_Silk-removebg-preview.png" alt="Company_logo"></a>
            </div>
            <div class="nav-links">
            <a href="#"  style="color: var(--white)">E-Shop</a>
            <a href="#"  style="color: var(--white)">Our Stores</a>
            <a href="#"  style="color: var(--white)">About Us</a>
            <a href="#"  style="color: var(--white)">News</a>
            </div>
            <div class="nav-actions">
                <a href="#"  style="color: var(--white)"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="nav-icon">
                <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path>
                <circle cx="12" cy="7" r="4"></circle>
                </svg></a>

                <a href="#"  style="color: var(--white)"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="nav-icon">
                <circle cx="9" cy="21" r="1"></circle>
                <circle cx="20" cy="21" r="1"></circle>
                <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                </svg></a>
            </div>
        </header>
        <div class="hero-section">
            <h1>Indulge in Timeless <br>Elegance</h1>
            <h3>Handcrafted pastries and delicate <br>creations made to elevate every <br>moment.</h3>
            <div class="hero-buttons">
                <button class="btn btn-primary">Shop Now</button>
                <button class="btn btn-outline">Our Locations</button>
            </div>
        </div>
        </div>
    </nav>
    <section class="specialities">
        <div class="specialities-heading">
            <h2>Our Specialities</h2>
            <p class="subtitle">Our signature treats crafted with passion, bringing together artistry, flavor, and timeless indulgence.</p>
        </div>
        <div class="grid-container"> 
            <div class="grid-card">
                    <div class="img-wrapper">
                        <img src="${pageContext.request.contextPath}/images/pexels-andreea-07-2155708476-33863191.jpg" alt="Pastry">
                        <button class="add-to-cart">Add to Cart</button>
                    </div>
                    <h3>Classic Macarons</h3>
                    <p>$12.00</p>
            </div>
            <div class="grid-card">
                    <div class="img-wrapper">
                        <img src="${pageContext.request.contextPath}/images/pexels-amanda-hemphill-2407528-7440405.jpg" alt="Pastry">
                        <button class="add-to-cart">Add to Cart</button>
                    </div>
                    <h3>Almond Croissant</h3>
                    <p>$6.00</p>
            </div>
            <div class="grid-card">
                    <div class="img-wrapper">
                        <img src="${pageContext.request.contextPath}/images/pexels-avonnephoto-6392782.jpg" alt="Pastry">
                        <button class="add-to-cart">Add to Cart</button>
                    </div>
                    <h3>Berry Tartlet</h3>
                    <p>$8.50</p>
            </div>
            <div class="grid-card">
                    <div class="img-wrapper">
                        <img src="${pageContext.request.contextPath}/images/pexels-manish-jain-1176829519-30846578.jpg" alt="Pastry">
                        <button class="add-to-cart">Add to Cart</button>
                    </div>
                    <h3>Chocolate Éclair</h3>
                    <p>$7.00</p>
            </div>
        </div>
        <div class="all-products">
            <button class="btn btn-primary">See All Products</button>
        </div>   
    </section>

    <section class="location">
        <div class="location-text">
            <h2>Our Locations</h2>
            <p>More than 20 locations all over in Nepal</p>
            <button class="btn btn-primary">Discover Our Locations</button>        
        </div>
    </section>

    <section class="about">
        <div class="about-container">
            <div class="about-image">
                <img src="${pageContext.request.contextPath}/images/pexels-seymorella-1100375572-20769930.jpg" alt="image">
            </div>
            <div class="content">
                <h2>About Us</h2>
                <p>At Sugar & Silk, we craft each creation with care, blending timeless techniques with refined flavors. Every pastry is designed to be both elegant and indulgent, offering a moment of quiet luxury in every bite.
                    From delicate confections to rich, decadent desserts, every piece is designed to offer a moment of elegance and comfort.  </p>
                <button class="btn btn-primary">Learn More</button>
            </div>
        </div>
    </section>

    <section class="news">
        <div class="margins">
        <div class="news-heading">
            <h2>News About Us</h2>
            <p class="subtitle-news">Stay informed on our newest collections, handcrafted delicacies, and exclusive seasonal releases </p>
            <p class="subtitle-news-2">from our artisan bakery</p>
        </div>
        <div class="grid-container"> 
            <div class="grid-card">
            	<a href="#" class="news-link">
                    <div class="img-wrapper">
                        <img src="${pageContext.request.contextPath}/images/pexels-mdsnmdsnmdsn-192933.jpg" alt="Pastry">
                    </div>
                    <h3>News Titile goes here</h3>
                    <p>“Lorem ipsum dolor sit amet, consectetur adipiscing elit”</p>
                </a>
            </div>
            <div class="grid-card">
            	<a href="#" class="news-link">
                    <div class="img-wrapper">
                        <img src="${pageContext.request.contextPath}/images/pexels-yasin-onus-520099596-36445004.jpg" alt="Pastry">
                    </div>
                    <h3>News Titile goes here</h3>
                    <p>“Lorem ipsum dolor sit amet, consectetur adipiscing elit”</p>
                 </a>
            </div>
            <div class="grid-card">
            	<a href="#" class="news-link">
                    <div class="img-wrapper">
                        <img src="${pageContext.request.contextPath}/images/pexels-calvinseng-31688651.jpg" alt="Pastry">
                    </div>
                    <h3>News Titile goes here</h3>
                    <p>“Lorem ipsum dolor sit amet, consectetur adipiscing elit”</p>
                </a>
            </div>
            <div class="grid-card">
            	<a href="#" class="news-link">
                    <div class="img-wrapper">
                        <img src="${pageContext.request.contextPath}/images/pexels-yasin-onus-520099596-36445126.jpg" alt="Pastry">
                    </div>
                    <h3>News Titile goes here</h3>
                    <p>“Lorem ipsum dolor sit amet, consectetur adipiscing elit”</p>
                 </a>
            </div>
        </div>
        <div class="all-products">
            <button class="btn btn-primary">View More</button>
        </div>   
        </div>
    </section>
    <section class="quote-section">
        <div class="quote">
            <p>Since 2000</p>
            <h3>Sugar & Silk — where sweetness meets elegance, and every detail is delicately crafted.</h3>
        </div>

    </section>
    <%@ include file="footer.jsp" %>
    
</body>
</html>