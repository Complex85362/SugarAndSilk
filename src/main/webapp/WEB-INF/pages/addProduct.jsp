<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sugar & Silk | Add Product</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addProduct.css">
</head>
<body>

<div class="wrapper">
    <div class="form-header">
        <h1 class="bakery-name">Sugar & Silk</h1>
        <div class="divider"></div>
        <h2>Add Product</h2>
    </div>

    <form action="AddProductServlet" method="post">
        <div class="flex-container">
            
            <div class="form-row full">
                <label>Product Name</label>
                <input type="text" name="Product_Name" placeholder="e.g. Velvet Vanilla Bean Cake" required>
            </div>

            <div class="form-row half">
                <label>Category</label>
                <select name="Category_id" required>
                    <option value="" disabled selected>Select Category</option>
                    <option value="1">Artisan Cakes</option>
                    <option value="2">Daily Bread</option>
                    <option value="3">Bakery Events</option>
                    <option value="4">Flash Sales</option>
                </select>
            </div>

            <div class="form-row half">
                <label>Price ($)</label>
                <input type="number" name="Product_price" step="0.01" placeholder="0.00" required>
            </div>

            <div class="form-row full">
                <label>Initial Stock Quantity</label>
                <input type="number" name="Stock_quantity" placeholder="Units available" required>
            </div>

            <div class="form-row full">
                <label>Product Description</label>
                <textarea name="Product_description" placeholder="List allergens or flavor notes..."></textarea>
            </div>
        </div>

        <div class="btns">
            <button type="submit" class="btn-primary">Add to Inventory</button>
            <button type="reset" class="btn-secondary">Clear</button>
        </div>
    </form>
</div>

</body>
</html>