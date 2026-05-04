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
        <div class="logo">S&S <span>Sugar & Silk</span></div>

        <ul>
            <li><a href="${pageContext.request.contextPath}/dashboard">Command Center</a></li>
            <li>Orders & Sales</li>

            <li class="active"><a href="${pageContext.request.contextPath}/addProduct">Add Product</a></li>
            <li><a href="${pageContext.request.contextPath}/updateProduct">Update Menu</a></li>

            <li>Users</li>
            <li>Inbox</li>
            <li>Delivery Map</li>
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
                <input type="text" name="Product_Name" placeholder="e.g. Velvet Vanilla Bean Cake">
            </div>

            <div class="form-row half">
                <label>Category</label>
                <select name="Category_id">
                    <option value="" disabled selected>Select Category</option>
                    <option value="1">Artisan Cakes</option>
                    <option value="2">Daily Bread</option>
                    <option value="3">Bakery Events</option>
                    <option value="4">Flash Sales</option>
                </select>
            </div>

            <div class="form-row half">
                <label>Price ($)</label>
                <input type="number" name="Product_price" step="0.01" placeholder="0.00">
            </div>

            <div class="form-row full">
                <label>Stock Quantity</label>
                <input type="number" name="Stock_quantity" placeholder="Units available">
            </div>

            <div class="form-row full">
                <label>Product Description</label>
                <textarea name="Product_description" placeholder="Update flavor notes or allergens..."></textarea>
            </div>
            <div class="form-row full">

			    <label>Product Image</label>
			
			    <div class="image-upload-box">
			
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
	
    <!-- DELETE SECTION (Side-by-Side) -->
    <div class="delete-section">
        <div class="divider small"></div>
        <h2 class="delete-title">Delete Product</h2>
        
        <c:if test="${param.deleteSuccess == 'true'}">
	    <div style="color: #155724; background-color: #d4edda; border: 1px solid #c3e6cb; padding: 10px; border-radius: 5px; margin-bottom: 20px;">
	        <strong>Deleted!</strong> The product has been successfully removed from the database.
	    </div>
	</c:if>
	
	<%-- Error Alert --%>
	<c:if test="${param.deleteError == 'true'}">
	    <div style="color: #721c24; background-color: #f8d7da; border: 1px solid #f5c6cb; padding: 10px; border-radius: 5px; margin-bottom: 20px;">
	        <strong>Delete Failed!</strong> Could not find that Product ID or a database error occurred.
	    </div>
	</c:if>
        <form action="DeleteProduct" method="post" class="delete-form">
            <div class="delete-flex">
                <div class="form-row">
                    <label>ID to Remove</label>
                    <input type="number" name="Product_ID" placeholder="Enter ID" required>
                </div>
                <button type="submit" class="btn-delete" onclick="return confirm('Are you sure?')">Delete Item</button>
            </div>
        </form>
    </div>
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