<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar & Silk | Command Center</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
</head>

<body>
<div class="container">

    <!-- SIDEBAR -->
    <div class="sidebar">
        <div class="logo">S&S <span>Sugar & Silk</span></div>

        <ul>
            <li class="active"><a href="dashboard.jsp" style="color: inherit;">Command Center</a></li>
            <li>Orders & Sales</li>

            <li><a href="addProduct.jsp">Add Product</a></li>
            <li><a href="Update.jsp">Update Menu</a></li>

            <li>Users</li>
            <li>Inbox</li>
            <li>Delivery Map</li>
        </ul>

        <button class="logout">LOGOUT</button>
    </div>

    <!-- MAIN CONTENT -->
    <div class="main">

        <!-- TOP BAR -->
        <div class="topbar">
            <h2>Command Center</h2>

            <form action="SearchUserServlet" method="get" class="search-container">
                <input type="text" name="username" placeholder="Search users">
                <button type="submit" class="search-btn">Search</button>
            </form>
        </div>

        <!-- CARDS -->
        <div class="cards">
            <div class="card">
                <p>Today's Revenue</p>
                <h3>$4,820.50</h3>
            </div>

            <div class="card">
                <p>Oven Schedule</p>
                <h3>Batch #42</h3>
                <span>Macarons: 12m left</span>
            </div>

            <div class="card">
                <p>Active Deliveries</p>
                <h3>8 Drivers</h3>
                <span>4 Out / 4 Idle</span>
            </div>
        </div>

        <!-- USER MANAGEMENT -->
        <div class="section">
            <h3>User Management</h3>

            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Peter Parker</td>
                        <td>peter@man.com</td>
                        <td>Customer</td>
                        <td><span class="active-status">Active</span></td>
                        <td>
                            <label class="switch">
                                <input type="checkbox" checked onchange="toggleStatus(this)">
                                <span class="slider round"></span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>James Sterling</td>
                        <td>james@events.com</td>
                        <td>Customer</td>
                        <td><span class="inactive-status">Inactive</span></td>
                        <td>
                            <label class="switch">
                                <input type="checkbox" onchange="toggleStatus(this)">
                                <span class="slider round"></span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>Suzanne Harvey</td>
                        <td>suzi@harv.com</td>
                        <td>Customer</td>
                        <td><span class="active-status">Active</span></td>
                        <td>
                            <label class="switch">
                                <input type="checkbox" checked onchange="toggleStatus(this)">
                                <span class="slider round"></span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>MJ</td>
                        <td>mj@spy.np</td>
                        <td>Cafe Owner</td>
                        <td><span class="active-status">Active</span></td>
                        <td>
                            <label class="switch">
                                <input type="checkbox" checked onchange="toggleStatus(this)">
                                <span class="slider round"></span>
                            </label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- MENU & INVENTORY -->
        <div class="section">
            <h3>Menu & Inventory</h3>

            <div class="item">
                <p>Blueberry Cheesecake (Stock: 420)</p>
                <div class="bar"><div class="fill green" style="width: 85%;"></div></div>
            </div>

            <div class="item">
                <p>Classic Croissant (Stock: 15)</p>
                <div class="bar"><div class="fill orange" style="width: 20%;"></div></div>
            </div>
        </div>

    </div>
</div>

<script>
/**
 * Updates the 'Status' badge text and color when the toggle switch is flipped
 */
function toggleStatus(checkbox) {
    let row = checkbox.closest("tr");
    let statusSpan = row.querySelector("td span");

    if (checkbox.checked) {
        statusSpan.className = "active-status";
        statusSpan.innerText = "Active";
    } else {
        statusSpan.className = "inactive-status";
        statusSpan.innerText = "Inactive";
    }
}
</script>

</body>
</html>