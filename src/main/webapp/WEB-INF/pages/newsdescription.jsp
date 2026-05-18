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
		<%-- Back link --%>
        <div style="margin-top:30px;">
            <a href="${pageContext.request.contextPath}/news"
               style="color:#C5A059;text-decoration:none;font-size:14px;
                      border:1px solid #C5A059;padding:8px 20px;border-radius:20px;">
                &#8592; Back to News
            </a>
        </div>
	
	
	
        <div class="news-content-wrapper">

            <%-- Left side: text --%>
            <div class="news-text-section">
                <h1 class="news-title">${news.title}</h1>
                <div class="news-body">
                    <%-- Use <c:out> to safely output content;
                         line breaks are preserved via CSS white-space or can be wrapped in <p> --%>
                    <p>${news.content}</p>
                </div>
            </div>

            <%-- Right side: image --%>
            <div class="news-image-section">
                <img src="${pageContext.request.contextPath}/images/${news.imagePath}"
                     alt="${news.title}"
                     class="main-news-img">
            </div>

        </div>

        
    </main>
<%@ include file="footer.jsp" %>
</body>
</html>