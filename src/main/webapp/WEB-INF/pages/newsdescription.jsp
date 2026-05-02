<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/newsdescription.css">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
	<main class="news-detail-container">
    <div class="news-content-wrapper">
        <!-- Left Side: Text Content -->
        <div class="news-text-section">
            <h1 class="news-title">Silk & Song Unveils Its New Signature Collection</h1>
            <div class="news-body">
                <p>Silk & Song proudly introduces its new Signature Collection, 
                    a curated selection of refined patisserie creations that embody 
                    elegance, creativity, and exceptional craftsmanship. 
                </p>
                <p>Each piece in the collection is thoughtfully designed using the 
                    finest ingredients, bringing together delicate flavors and 
                    exquisite presentation. This launch reflects our continued 
                    dedication to elevating the dessert experience in Nepal, 
                    offering our guests a taste of sophistication with every bite.
                </p>
            </div>
        </div>
        <!-- Right Side: Main Feature Image -->
        <div class="news-image-section">
            <img src="${pageContext.request.contextPath}/images/new-2.jpg" alt="Signature Collection Display" class="main-news-img">
        </div>
    </div>
	</main>
<%@ include file="footer.jsp" %>
</body>
</html>