<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sugar & Silk | Update Product</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/updateProduct.css">
</head>
<body>

<div class="wrapper">
    <div class="form-header">
        <h1 class="bakery-name">Sugar & Silk</h1>
        <div class="divider"></div>
        <h2>Product Update</h2>
    </div>

    <!-- action points to your Update Servlet -->
    <form action="UpdateProductServlet" method="post">
        
        <!-- Field to identify which product to change -->
        <div class="form-row full search-row">
            
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

</body>
</html>