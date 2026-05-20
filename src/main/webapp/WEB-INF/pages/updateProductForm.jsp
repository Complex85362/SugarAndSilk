<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar &amp; Silk | Update Product</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productManagement.css">
    <style>
        /* Extra styles specific to the update form page */
        .update-wrapper {
            max-width: 780px;
            margin: 0 auto;
        }
        .back-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            color: #e17899;
            font-weight: 600;
            font-size: 14px;
            margin-bottom: 28px;
            padding: 10px 20px;
            border: 1.5px solid #e17899;
            border-radius: 50px;
            transition: 0.3s;
        }
        .back-btn:hover {
            background: #e17899;
            color: white;
        }
        .current-img-box {
            display: flex;
            align-items: center;
            gap: 20px;
            padding: 15px;
            background: #fff5f7;
            border-radius: 15px;
            margin-bottom: 12px;
        }
        .current-img-box img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 10px;
            border: 2px solid #fce4ec;
        }
        .current-img-box span {
            font-size: 13px;
            color: #888;
        }
        .page-title-bar {
            display: flex;
            align-items: baseline;
            gap: 15px;
            margin-bottom: 30px;
        }
        .page-title-bar h1 {
            font-size: 52px;
            color: #e17899;
            font-style: italic;
            font-weight: normal;
        }
        .page-title-bar h2 {
            color: #C5A059;
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 5px;
            font-family: Arial, sans-serif;
        }
    </style>
</head>
<body>
<div class="container">

    <!-- SIDEBAR -->
    <div class="sidebar">
        <div class="logo">
        <a href="${pageContext.request.contextPath}/home" class="logo-link">
        S&S <span>Sugar & Silk</span>
        </a></div>
        <ul>
            <li><a href="${pageContext.request.contextPath}/dashboard">Command Center</a></li>
            <li><a href="${pageContext.request.contextPath}/addProduct">Add Product</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/productManagement">Product Management</a></li>
            <li><a href="${pageContext.request.contextPath}/addNews">Add News</a></li>
            <li><a href="${pageContext.request.contextPath}/newsManagement">News Management</a></li>
            <li><a href="${pageContext.request.contextPath}/enquiryManagement">Enquiries</a></li>
        </ul>
        <a href="${pageContext.request.contextPath}/logout">
            <a href="${pageContext.request.contextPath}/logout" class="logout">LOGOUT</a>
        </a>
    </div>

    <!-- MAIN -->
    <div class="main">
        <div class="update-wrapper">

            <!-- BACK BUTTON - No session/query strings needed -->
            <a href="${pageContext.request.contextPath}/productManagement" class="back-btn">
                ← Back to Product Management
            </a>

            <!-- TITLE -->
            <div class="page-title-bar">
                <h1>Sugar &amp; Silk</h1>
                <h2>Update Product</h2>
            </div>

            <!-- BACKEND ERRORS - Uses request attributes (set by servlet on form re-forward) -->
            <c:if test="${not empty errors}">
                <div class="alert alert-error">
                    Please correct the highlighted fields below.
                </div>
            </c:if>

            <%--
                'product' is a request attribute set by the servlet from the DB.
                'typed*' attributes are only set when we forward back after validation failure.
                Priority: typed > DB
            --%>

            <form action="${pageContext.request.contextPath}/updateProduct"
                  method="post"
                  enctype="multipart/form-data"
                  novalidate>

                <!-- Hidden: productId is already in the session, don't expose in HTML -->

                <div class="section add-section">
                    <div class="flex-container">

                        <!-- Product Name -->
                        <div class="form-row full">
                            <label>Product Name</label>
                            <input type="text"
                                   name="Product_Name"
                                   value="${not empty typedName ? typedName : product.productName}"
                                   placeholder="Product name"
                                   required>
                            <c:if test="${errors.name != null}">
                                <small class="error">${errors.name}</small>
                            </c:if>
                        </div>

                        <!-- Category -->
                        <div class="form-row half">
                            <label>Category</label>
                            <select name="Category_id" required>
                                <option value="" disabled>Select Category</option>
                                <c:set var="selCat" value="${not empty typedCategory ? typedCategory : product.categoryId}"/>
                                <option value="1" <c:if test="${selCat == '1' || selCat == 1}">selected</c:if>>Artisan Cakes</option>
                                <option value="2" <c:if test="${selCat == '2' || selCat == 2}">selected</c:if>>Daily Bread</option>
                                <option value="3" <c:if test="${selCat == '3' || selCat == 3}">selected</c:if>>Bakery Events</option>
                                <option value="4" <c:if test="${selCat == '4' || selCat == 4}">selected</c:if>>Flash Sales</option>
                            </select>
                            <c:if test="${errors.category != null}">
                                <small class="error">${errors.category}</small>
                            </c:if>
                        </div>

                        <!-- Price -->
                        <div class="form-row half">
                            <label>Price ($)</label>
                            <input type="number"
                                   name="Product_price"
                                   step="0.01"
                                   min="0.01"
                                   value="${not empty typedPrice ? typedPrice : product.productPrice}"
                                   placeholder="0.00"
                                   required>
                            <c:if test="${errors.price != null}">
                                <small class="error">${errors.price}</small>
                            </c:if>
                        </div>

                        <!-- Stock -->
                        <div class="form-row full">
                            <label>Stock Quantity</label>
                            <input type="number"
                                   name="Stock_quantity"
                                   min="0"
                                   step="1"
                                   value="${not empty typedStock ? typedStock : product.stockQuantity}"
                                   placeholder="Units available"
                                   required>
                            <c:if test="${errors.stock != null}">
                                <small class="error">${errors.stock}</small>
                            </c:if>
                        </div>

                        <!-- Description -->
                        <div class="form-row full">
                            <label>Product Description</label>
                            <textarea name="Product_description"
                                      placeholder="Flavor notes, allergens..."
                                      required><c:out value="${not empty typedDescription ? typedDescription : product.productDescription}"/></textarea>
                            <c:if test="${errors.description != null}">
                                <small class="error">${errors.description}</small>
                            </c:if>
                        </div>

                        <!-- Image (optional on update) -->
                        <div class="form-row full">
                            <label>Product Image <span style="color:#aaa;font-weight:normal;">(optional – leave blank to keep current)</span></label>

                            <!-- Show the current image if there is one -->
                            <c:if test="${not empty product.productImage}">
                                <div class="current-img-box">
                                    <img src="${pageContext.request.contextPath}/images/${product.productImage}"
                                         alt="Current product image"
                                         onerror="this.style.display='none'">
                                    <span>Current image: <strong>${product.productImage}</strong></span>
                                </div>
                            </c:if>

                            <div class="image-upload-box">
                                <div class="image-preview">
                                    <span id="upImgPlaceholder">🖼</span>
                                    <img id="upPreview" src="#" alt="New image preview" style="display:none;">
                                </div>
                                <label class="image-upload-btn">
                                    Choose New Image
                                    <input type="file"
                                           name="Product_Image"
                                           accept="image/*"
                                           onchange="if(this.files[0]) { document.getElementById('upPreview').src = URL.createObjectURL(this.files[0]); document.getElementById('upPreview').style.display = 'block'; document.getElementById('upImgPlaceholder').style.display = 'none'; }">
                                </label>
                            </div>
                            <c:if test="${errors.image != null}">
                                <small class="error">${errors.image}</small>
                            </c:if>
                        </div>

                    </div><!-- /flex-container -->

                    <div class="btns">
                        <button type="submit" class="btn-primary">Save Changes</button>
                        <a href="${pageContext.request.contextPath}/productManagement"
                           class="btn-secondary" style="text-align:center;line-height:1.4;text-decoration:none;">
                            Cancel
                        </a>
                    </div>
                </div>

            </form>
        </div><!-- /update-wrapper -->
    </div><!-- /main -->
</div><!-- /container -->

</body>
</html>
