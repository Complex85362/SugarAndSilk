<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <title>Document</title>
</head>
<body>
    <nav>
        <div class="home-page-banner">
        <header class="navbar">
            <div class="logo">
                <a href="test.html"><img src="${pageContext.request.contextPath}/images/A_logo_for_a_company_named_Sugar___Silk__make_the_font_PlayFair_Display__also_make_sure_that_there_is_some_design_Between_the___and_Silk-removebg-preview.png" alt="Company_logo"></a>
            </div>
            <div class="nav-links">
            <a href="#">E-Shop</a>
            <a href="#">Our Stores</a>
            <a href="#">About Us</a>
            <a href="#">News</a>
            </div>
            <div class="nav-actions">
                <span>Hello Username!</span>
                <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="nav-icon">
                <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path>
                <circle cx="12" cy="7" r="4"></circle>
                </svg></a>

                <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="nav-icon">
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
    <footer class="main-footer">
    <div class="footer-container">
        <div class="footer-col">
            <h4>Find Us</h4>
            <p>Our locations</p>
            <p>Contact Us</p>
            <p>Phone: <br>9771000000 <br>9876543210</p>
        </div>

        <div class="footer-col">
            <h4>About Us</h4>
            <p><a href="#">Our Story</a></p>
            <p><a href="#">Our Products</a></p>
            <p><a href="#">Need Help?</a></p>
        </div>

        <div class="footer-col" style="text-align: right;">
            <h4>Our Terms & Conditions</h4>
            <p><a href="#">Our  Terms of delivery</a></p>
            <p><a href="#">Our Terms of sale</a></p>
            <p><a href="#">Cookies Settings</a></p>
            <p><a href="#">Privacy Setting</a></p>
        </div>

        <div class="footer-col" style="text-align: right;">
            <h4>Follow Us</h4>
            <div class="social-icons">
    
                <!-- Instagram -->
                <a href="#" aria-label="Instagram">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" class="social-svg">
                        <rect x="2" y="2" width="20" height="20" rx="5"></rect>
                        <circle cx="12" cy="12" r="4"></circle>
                        <circle cx="18" cy="6" r="1"></circle>
                    </svg>
                </a>

                <!-- Facebook -->
                <a href="#" aria-label="Facebook">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" class="social-svg">
                        <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path>
                    </svg>
                </a>

                <!-- X (Twitter) -->
                <a href="#" aria-label="X">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" class="social-svg-fill">
                        <path d="M18.901 1.153h3.68l-8.04 9.19L24 22.846h-7.406l-5.8-7.584-6.638 7.584H.474l8.6-9.83L0 1.154h7.594l5.243 6.932 6.064-6.932zm-1.292 19.494h2.039L6.486 3.24H4.298l13.311 17.407z"></path>
                    </svg>
                </a>

                <!-- LinkedIn -->
                <a href="#" aria-label="LinkedIn">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" class="social-svg">
                        <path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"></path>
                        <rect x="2" y="9" width="4" height="12"></rect>
                        <circle cx="4" cy="4" r="2"></circle>
                    </svg>
                </a>

                <!-- YouTube -->
                <a href="#" aria-label="YouTube">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" class="social-svg-fill">
                        <path d="M23 7s-.2-1.7-.8-2.5c-.8-1-1.7-1-2.1-1C16.8 3 12 3 12 3h0s-4.8 0-8.1.5c-.4 0-1.3 0-2.1 1C1.2 5.3 1 7 1 7S1 8.8 1 10.6v1.8C1 14.2 1 16 1 16s.2 1.7.8 2.5c.8 1 1.9 1 2.4 1.1 1.7.2 7.8.5 7.8.5s4.8 0 8.1-.5c.4 0 1.3 0 2.1-1 .6-.8.8-2.5.8-2.5s0-1.8 0-3.6v-1.8C23 8.8 23 7 23 7zM9.8 14.5V8.5l6 3-6 3z"></path>
                    </svg>
                </a>
            </div>
    </div>
</footer>
    
</body>
</html>