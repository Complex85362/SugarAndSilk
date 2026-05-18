<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar & Silk | Manage Inventory</title>
    <link rel="stylesheet" href="css/addProduct.css">
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
           <li><a href="${pageContext.request.contextPath}/dashboard" style="color: inherit;">Command Center</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/addProduct">Add Product</a></li>
            <li><a href="${pageContext.request.contextPath}/productManagement">Product Management</a></li>
        </ul>

        <button class="logout">LOGOUT</button>
    </div>



<div class="main-content">

<div class="wrapper">
    <!-- Header Section -->
    <div class="form-header">
        <h1 class="bakery-name">Sugar & Silk</h1>
        <div class="divider"></div>
        <h2>Product Management</h2>
    </div>
    
    <%-- Success Message for New Products --%>
	<c:if test="${param.success == 'true'}">
	    <div style="color: #155724; background-color: #d4edda; border: 1px solid #c3e6cb; padding: 10px; border-radius: 5px; margin-bottom: 20px;">
	        <strong>Success!</strong> The new product has been added to the Sugar & Silk inventory.
	    </div>
	</c:if>
	
	<%-- Error Message for New Products --%>
	<c:if test="${param.error == 'true'}">
	    <div style="color: #721c24; background-color: #f8d7da; border: 1px solid #f5c6cb; padding: 10px; border-radius: 5px; margin-bottom: 20px;">
	        <strong>Error!</strong> There was a problem saving the product. Please check the logs or try again.
	    </div>
	</c:if>
    
	<form action="${pageContext.request.contextPath}/addProduct" method="post" enctype="multipart/form-data">
        <div class="flex-container">
            <div class="form-row full">
                <label>Product Name</label>
                <input type="text" name="Product_Name" value="${name}" placeholder="e.g. Velvet Vanilla Bean Cake">
                <c:if test="${errors.name != null}">
                	<small class="error">${errors.name}</small>
                </c:if>
            </div>

            <div class="form-row half">
                <label>Category</label>
                <select name="Category_id">
				    <option value="" disabled
				        <c:if test="${empty category}">selected</c:if>>
				        Select Category
				    </option>
				
				    <option value="1" <c:if test="${category == '1'}">selected</c:if>>Artisan Cakes</option>
				    <option value="2" <c:if test="${category == '2'}">selected</c:if>>Daily Bread</option>
				    <option value="3" <c:if test="${category == '3'}">selected</c:if>>Bakery Events</option>
				    <option value="4" <c:if test="${category == '4'}">selected</c:if>>Flash Sales</option>
				</select>
				
				<c:if test="${errors.category != null}">
				    <small class="error">${errors.category}</small>
				</c:if>
            </div>

            <div class="form-row half">
                <label>Price ($)</label>
                <input type="number" name="Product_price" step="0.01" value="${price}" placeholder="0.00">
                <c:if test="${errors.price != null}">
                	<small class="error">${errors.price}</small>
                </c:if>
            </div>

            <div class="form-row full">
                <label>Stock Quantity</label>
                <input type="number" name="Stock_quantity" value="${stock}" placeholder="Units available">
				<c:if test="${errors.stock != null}">
				    <small class="error">${errors.stock}</small>
				</c:if>
            </div>

            <div class="form-row full">
                <label>Product Description</label>
				<textarea name="Product_description" placeholder="Update flavor notes or allergens...">${description}</textarea>
				
				<c:if test="${errors.description != null}">
				    <small class="error">${errors.description}</small>
				</c:if>
            </div>
            <div class="form-row full">

			    <label>Product Image</label>
			
			    <div class="image-upload-box">
					<c:if test="${errors.image != null}">
					    <small class="error">${errors.image}</small>
					</c:if>
			        <!-- Preview box -->
			        <div class="image-preview">
			            <i class="fa-solid fa-image" id="imagePlaceholder"></i>
			            <img id="productPreview" src="#" alt="Preview Image">
			        </div>
			
			        <!-- File input -->
			        <label class="image-upload-btn">
			            Choose Image
			            <input type="file" name="Product_Image" accept="image/*" onchange="previewProductImage()">
			        </label>
			
			    </div>
			</div>
        </div>
        

        <div class="btns">
            <button type="submit" class="btn-primary">Add Product</button>
            <button type="reset" class="btn-secondary">Clear Fields</button>
        </div>
    </form>
	
    
</div>
</div>
</div>
<script>
function previewProductImage() {
    const fileInput = document.querySelector('input[name="Product_Image"]');
    const preview = document.getElementById('productPreview');
    const placeholder = document.getElementById('imagePlaceholder');

    const file = fileInput.files[0];

    if (file) {
        const reader = new FileReader();

        reader.onload = function(e) {
            preview.src = e.target.result;
            preview.style.display = "block";
            placeholder.style.display = "none";
        };

        reader.readAsDataURL(file);
    }
}
</script>
</body>
</html>