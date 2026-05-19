<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar & Silk | Update News</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productManagement.css">
    <style>
        .update-wrapper { max-width: 780px; margin: 0 auto; }

        .back-btn {
            display: inline-flex; align-items: center; gap: 8px;
            text-decoration: none; color: #e17899; font-weight: 600;
            font-size: 14px; margin-bottom: 28px;
            padding: 10px 20px; border: 1.5px solid #e17899;
            border-radius: 50px; transition: 0.3s;
        }
        .back-btn:hover { background: #e17899; color: white; }

        .current-img-box {
            display: flex; align-items: center; gap: 20px;
            padding: 15px; background: #fff5f7;
            border-radius: 15px; margin-bottom: 12px;
        }
        .current-img-box img {
            width: 80px; height: 80px; object-fit: cover;
            border-radius: 10px; border: 2px solid #fce4ec;
        }
        .current-img-box span { font-size: 13px; color: #888; }

        .page-title-bar {
            display: flex; align-items: baseline;
            gap: 15px; margin-bottom: 30px;
        }
        .page-title-bar h1 {
            font-size: 52px; color: #e17899;
            font-style: italic; font-weight: normal;
        }
        .page-title-bar h2 {
            color: #C5A059; font-size: 13px;
            text-transform: uppercase; letter-spacing: 5px;
        }

        textarea.news-content { height: 220px; resize: vertical; }
    </style>
</head>
<body>
<div class="container">

    <div class="sidebar">
        <div class="logo">
        <a href="${pageContext.request.contextPath}/home" class="logo-link">
        S&S <span>Sugar & Silk</span>
        </a></div>
        
        <ul>
            <li><a href="${pageContext.request.contextPath}/dashboard">Command Center</a></li>
            <li><a href="${pageContext.request.contextPath}/addProduct">Add Product</a></li>
            <li><a href="${pageContext.request.contextPath}/productManagement">Product Management</a></li>
            <li><a href="${pageContext.request.contextPath}/addNews">Add News</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/newsManagement">News Management</a></li>
            <li><a href="${pageContext.request.contextPath}/enquiryManagement">Enquiries</a></li>
        </ul>
        <a href="${pageContext.request.contextPath}/logout">
            <button class="logout">LOGOUT</button>
        </a>
    </div>

	<div class="main">
        <div class="update-wrapper">

            <a href="${pageContext.request.contextPath}/newsManagement" class="back-btn">
                &#8592; Back to News Management
            </a>

            <div class="page-title-bar">
                <h1>Sugar &amp; Silk</h1>
                <h2>Update News</h2>
            </div>

            <c:if test="${not empty errors}">
                <div class="alert alert-error">
                    Please correct the highlighted fields below.
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/updateNews" method="post" enctype="multipart/form-data" novalidate>

                <%-- Pass the news ID as a hidden field so the servlet knows which record to update --%>
                <input type="hidden" name="News_id" value="${news.newsId}">

                <div class="section add-section">
                    <div class="flex-container">

                        <%-- Title --%>
                        <div class="form-row full">
                            <label>News Title</label>
                            <input type="text" name="Title" value="${not empty title ? title : news.title}" placeholder="News title" required>
                            <c:if test="${errors.title != null}">
                                <small class="error">${errors.title}</small>
                            </c:if>
                        </div>

                        <%-- Content --%>
                        <div class="form-row full">
                            <label>News Content</label>
                            <textarea name="Content" class="news-content" placeholder="Full article content..." required><c:out value="${not empty content ? content : news.content}"/></textarea>
                            <c:if test="${errors.content != null}">
                                <small class="error">${errors.content}</small>
                            </c:if>
                        </div>

                        <%-- Image (optional on update) --%>
                        <div class="form-row full">
                            <label>
                                News Image
                                <span style="color:#aaa;font-weight:normal;">(optional – leave blank to keep current)</span>
                            </label>

                            <c:if test="${not empty news.imagePath}">
                                <div class="current-img-box">
                                    <img src="${pageContext.request.contextPath}/images/${news.imagePath}"
                                         alt="Current news image"
                                         onerror="this.style.display='none'">
                                    <span>Current image: <strong>${news.imagePath}</strong></span>
                                </div>
                            </c:if>

                            <div class="image-upload-box">
                                <div class="image-preview">
                                    <i id="upImgPlaceholder" style="font-size:28px;color:#e17899;">&#128247;</i>
                                    <img id="upPreview" src="#" alt="New image preview" style="display:none;width:100%;height:100%;object-fit:cover;">
                                </div>
                                <label class="image-upload-btn">
                                    Choose New Image
                                    <input type="file" name="Image_Path" accept="image/*" onchange="previewNewsImage()">
                                </label>
                            </div>

                            <c:if test="${errors.image != null}">
                                <small class="error">${errors.image}</small>
                            </c:if>
                        </div>

                    </div>

                    <div class="btns">
                        <button type="submit" class="btn-primary">Save Changes</button>
                        <a href="${pageContext.request.contextPath}/newsManagement"
                           class="btn-secondary"
                           style="text-align:center;line-height:1.4;text-decoration:none;">
                            Cancel
                        </a>
                    </div>
                </div>

            </form>

        </div>
    </div>
</div>
</body>
</html>
