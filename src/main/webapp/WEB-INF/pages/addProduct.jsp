<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar & Silk | Manage Inventory</title>
    <link rel="stylesheet" href="css/addProduct.css">
</head>
<body>

<div class="wrapper">
    <!-- Header Section -->
    <div class="form-header">
        <h1 class="bakery-name">Sugar & Silk</h1>
        <div class="divider"></div>
        <h2>Product Management</h2>
    </div>

        <div class="flex-container">
            <div class="form-row full">
                <label>Product Name</label>
                <input type="text" name="Product_Name" placeholder="e.g. Velvet Vanilla Bean Cake">
            </div>

            <div class="form-row half">
                <label>Category</label>
                <select name="Category_id">
                    <option value="" disabled selected>Select Category</option>
                    <option value="1">1: Artisan Cakes</option>
                    <option value="2">2: Daily Bread</option>
                    <option value="3">3: Bakery Events</option>
                    <option value="4">4: Flash Sales</option>
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
        
        <form action="DeleteProductServlet" method="post" class="delete-form">
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

</body>
</html>