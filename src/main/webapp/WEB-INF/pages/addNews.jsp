<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar &amp; Silk | Add News</title>
    <%-- Reuse addProduct.css — same sidebar, form, and button styles --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addProduct.css">
    <style>
        textarea.news-content {
            height: 200px;
            resize: vertical;
        }
    </style>
</head>
<body>
<div class="container">

    <div class="sidebar">
        <div class="logo">
        <a href="${pageContext.request.contextPath}/home" class="logo-link">
        S&S <span>Sugar & Silk</span>
        </a>
        </div>

        <ul>
            <li><a href="${pageContext.request.contextPath}/dashboard">Command Center</a></li>
            <li><a href="${pageContext.request.contextPath}/addProduct">Add Product</a></li>
            <li><a href="${pageContext.request.contextPath}/productManagement">Product Management</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/addNews">Add News</a></li>
            <li><a href="${pageContext.request.contextPath}/newsManagement">News Management</a></li>
            <li><a href="${pageContext.request.contextPath}/enquiryManagement">Enquiries</a></li>
        </ul>

        <a href="${pageContext.request.contextPath}/logout" class="logout">LOGOUT</a>
    </div>

    <div class="main-content">
    <div class="wrapper">

        <%-- Header --%>
        <div class="form-header">
            <h1 class="bakery-name">Sugar &amp; Silk</h1>
            <div class="divider"></div>
            <h2>News Management</h2>
        </div>

        <%-- Success message --%>
        <c:if test="${param.success == 'true'}">
            <div style="color:#155724;background:#d4edda;border:1px solid #c3e6cb;
                        padding:10px;border-radius:5px;margin-bottom:20px;">
                <strong>Published!</strong> The news article has been added successfully.
            </div>
        </c:if>

        <%-- Error message --%>
        <c:if test="${param.error == 'true'}">
            <div style="color:#721c24;background:#f8d7da;border:1px solid #f5c6cb;
                        padding:10px;border-radius:5px;margin-bottom:20px;">
                <strong>Error!</strong> There was a problem saving the article. Please try again.
            </div>
        </c:if>

        <%-- FORM --%>
        <form action="${pageContext.request.contextPath}/addNews"
              method="post"
              enctype="multipart/form-data">

            <div class="flex-container">

                <%-- Title --%>
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
                            <i id="newsPlaceholder" style="font-size:28px;color:#e17899;">&#128247;</i>
                            <img id="newsPreview" src="#" alt="Preview Image" style="display:none;width:100%;height:100%;object-fit:cover;">
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
                <button type="reset"  class="btn-secondary">Clear Fields</button>
            </div>

        </form>

    </div>
    </div>

</div>
<script>
function previewNewsImage() {
    var fileInput = document.querySelector('input[name="Image_Path"]');
    var preview   = document.getElementById('newsPreview');
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
