<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sugar & Silk | Update Product</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/updateProduct.css">
</head>
<body>
<div class="container">

    <!-- SIDEBAR (same as addProduct.jsp) -->
    <div class="sidebar">
        <div class="logo">S&S <span>Sugar & Silk</span></div>

        <ul>
            <li><a href="${pageContext.request.contextPath}/dashboard">Command Center</a></li>
            <li>Orders & Sales</li>

            <li><a href="${pageContext.request.contextPath}/addProduct">Add Product</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/updateProduct">Update Menu</a></li>

            <li>Users</li>
            <li>Inbox</li>
            <li>Delivery Map</li>
        </ul>

        <button class="logout">LOGOUT</button>
    </div>

    <!-- MAIN CONTENT WRAPPER -->
    <div class="main-content">
			<div class="wrapper">
			    <div class="form-header">
			        <h1 class="bakery-name">Sugar & Silk</h1>
			        <div class="divider"></div>
			        <h2>Product Update</h2>
			    </div>
				<%-- Success Message --%>
				<c:if test="${param.success == 'true'}">
				    <div style="color: #155724; background-color: #d4edda; border: 1px solid #c3e6cb; padding: 10px; border-radius: 5px; margin-bottom: 20px;">
				        <strong>Success!</strong> Inventory updated for Product ID: <c:out value="${param.Product_ID}" />.
				    </div>
				</c:if>
				
				<%-- Error Message --%>
				<c:if test="${param.error == 'true'}">
				    <div style="color: #721c24; background-color: #f8d7da; border: 1px solid #f5c6cb; padding: 10px; border-radius: 5px; margin-bottom: 20px;">
				        <strong>Update Failed!</strong> Please verify the Product ID exists and all fields are valid.
				    </div>
				</c:if>
			    <!-- action points to Update Servlet -->
			    <form action="updateProduct" method="post">
			        
			        <!-- Field to identify which product to change -->
			        <div class="form-row full search-row">
			            
			        <div class="flex-container">
			        <div class="form-row full">
                        <label>Product ID to Update</label>
                        <input type="number" name="Product_ID" placeholder="Enter the existing Product ID" required>
                    </div>
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
			                <label>Initial Stock Quantity</label>
			                <input type="number" name="Stock_quantity" placeholder="Units available">
			            </div>
			
			            <div class="form-row full">
			                <label>Product Description</label>
			                <textarea name="Product_description" placeholder="List allergens or flavor notes..."></textarea>
			            </div>
			        </div>
			
			        <div class="btns">
			            <button type="submit" class="btn-primary">Update Inventory</button>
			            <button type="reset" class="btn-secondary">Clear</button>
			        </div>
			    </form>
			</div>
		</div>
	</div>

</body>
</html>