<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

                <c:choose>
                    <c:when test="${empty newsList}">
                        <p style="text-align:center;color:#888;padding:40px 0;">
                            No news articles have been published yet. Check back soon!
                        </p>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="n" items="${newsList}">
                            <%-- Each card links to the detail page using the news ID --%>
                            <a href="${pageContext.request.contextPath}/newspage?id=${n.newsId}"
                               class="news-card">
                                <div class="card-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/${n.imagePath}"
                                         alt="${n.title}">
                                </div>
                                <div class="card-content">
                                    <h3>${n.title}</h3>
                                </div>
                            </a>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>

            </div>
        </section>
    </main>

	<%@ include file="footer.jsp" %>
    
</body>
</html>
</body>
</html>