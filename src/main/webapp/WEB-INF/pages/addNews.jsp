<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar &amp; Silk | Add News</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dashboard.css?v=4.6">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/addNews.css?v=4.6">
</head>
<body>

    <div class="admin-layout">

        <aside class="sidebar-panel">
            <div class="sidebar-brand">
                <a href="${pageContext.request.contextPath}/home" class="sidebar-brand-link">
                    <h2>S&S</h2>
                    <span>Sugar & Silk</span>
                </a>
            </div>
            
            <nav class="sidebar-menu">
                <a href="${pageContext.request.contextPath}/dashboard" class="menu-item">Command Center</a>
                <a href="${pageContext.request.contextPath}/addProduct" class="menu-item">Add Product</a>
                <a href="${pageContext.request.contextPath}/productManagement" class="menu-item">Product Management</a>
                <a href="${pageContext.request.contextPath}/addNews" class="menu-item active">Add News</a>
                <a href="${pageContext.request.contextPath}/newsManagement" class="menu-item">News Management</a>
                <a href="${pageContext.request.contextPath}/enquiryManagement" class="menu-item">Enquiries</a>
            </nav>
            
            <div class="sidebar-footer">
                <a href="${pageContext.request.contextPath}/logout" class="logout-btn">LOGOUT</a>
            </div>
        </aside>

        <main class="content-panel">
            <div class="wrapper">
                <div class="form-header">
                    <h1 class="bakery-name">Sugar &amp; Silk</h1>
                    <div class="divider"></div>
                    <h2>News Management</h2>
                </div>

                <c:if test="${param.success == 'true'}">
                    <div class="alert alert-success">
                        <strong>Published!</strong> The news article has been added successfully.
                    </div>
                </c:if>
                <c:if test="${param.error == 'true'}">
                    <div class="alert alert-error">
                        <strong>Error!</strong> There was a problem saving the article. Please try again.
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/addNews" method="post" enctype="multipart/form-data">
                    <div class="flex-container">
                        <div class="form-row full">
                            <label>News Title</label>
                            <input type="text" name="Title" value="${title}" placeholder="e.g. Our New Summer Collection Has Arrived">
                            <c:if test="${errors.title != null}">
                                <small class="error">${errors.title}</small>
                            </c:if>
                        </div>

                        <div class="form-row full">
                            <label>News Content</label>
                            <textarea name="Content" class="news-content" placeholder="Write the full article here...">${content}</textarea>
                            <c:if test="${errors.content != null}">
                                <small class="error">${errors.content}</small>
                            </c:if>
                        </div>

                        <div class="form-row full">
                            <label>News Image</label>
                            <c:if test="${errors.image != null}">
                                <small class="error">${errors.image}</small>
                            </c:if>
                            <div class="image-upload-box">
                                <div class="image-preview">
                                    <i id="newsPlaceholder">&#128247;</i>
                                    <img id="newsPreview" src="#" alt="Preview Image">
                                </div>
                                <label class="image-upload-btn">
                                    Choose Image
                                    <input type="file" name="Image_Path" accept="image/*" onchange="previewNewsImage()">
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="btns">
                        <button type="submit" class="btn-primary">Publish</button>
                        <button type="reset" class="btn-secondary">Clear Fields</button>
                    </div>
                </form>
            </div>
        </main>
    </div>

    <script>
    function previewNewsImage() {
        var fileInput = document.querySelector('input[name="Image_Path"]');
        var preview = document.getElementById('newsPreview');
        var placeholder = document.getElementById('newsPlaceholder');
        var file = fileInput.files[0];

        if (file) {
            var reader = new FileReader();
            reader.onload = function(e) {
                preview.src = e.target.result;
                preview.style.display = 'block';
                placeholder.style.display = 'none';
            };
            reader.readAsDataURL(file);
        }
    }
    </script>
</body>
</html>