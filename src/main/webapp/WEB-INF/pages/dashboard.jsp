<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <div class="logo">
        <a href="${pageContext.request.contextPath}/home" class="logo-link">
        S&S <span>Sugar & Silk</span>
        </a></div>

        <ul>
            <li class="active"><a href="${pageContext.request.contextPath}/dashboard" style="color: inherit;">Command Center</a></li>
            <li><a href="${pageContext.request.contextPath}/addProduct">Add Product</a></li>
            <li><a href="${pageContext.request.contextPath}/productManagement">Product Management</a></li>
            <li><a href="${pageContext.request.contextPath}/addNews">Add News</a></li>
            <li><a href="${pageContext.request.contextPath}/newsManagement">News Management</a></li>
            <li><a href="${pageContext.request.contextPath}/enquiryManagement">Enquiries</a></li>
        </ul>

        <button class="logout">LOGOUT</button>
    </div>

    <!-- MAIN CONTENT -->
    <div class="main">

        <!-- TOP BAR -->
        <div class="topbar">
            <h2>Command Center</h2>

            <div class="search-area">
                <!-- Search by ID -->
                <form action="${pageContext.request.contextPath}/dashboard" method="get" class="search-container">
                    <input type="number" name="searchId" placeholder="Enter User ID (e.g. 101)" value="${param.searchId}" min="1" step="1">
                    <button type="submit" class="search-btn">Search</button>
                </form>

                <%-- Show "Show All" only when a search is currently active --%>
                <c:if test="${not empty param.searchId}">
                    <a href="${pageContext.request.contextPath}/dashboard" class="show-all-btn">
                        Show All
                    </a>
                </c:if>
            </div>
        </div>

        <!-- LIVE STAT CARDS -->
        <div class="cards">

            <div class="card">
                <p>Total Products</p>
                <h3>${stats.totalProducts}</h3>
            </div>

            <div class="card">
                <p>Registered Customers</p>
                <h3>${stats.totalCustomers}</h3>
            </div>

            <div class="card">
                <p>Total Enquiries</p>
                <h3>${stats.totalEnquiries}</h3>
            </div>
        </div>


		<!-- USER MANAGEMENT SECTION -->
		<div class="section">
		    <h3>User Management</h3>
		    <table>
		        <thead>
		            <tr>
		                <th>Username</th>
		                <th>Email</th>
		                <th>Role</th>
		                <th>Status</th>
		                <th>Action</th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:forEach var="user" items="${userList}">
		                <tr>
		                    <td>${user.username}</td>
		                    <td>${user.email}</td>
		                    <td>${user.userRole}</td>
		                    <td>
		                        <span class="${user.active == 1 ? 'active-status' : 'inactive-status'}">
		                            ${user.active == 1 ? 'Active' : 'Inactive'}
		                        </span>
		                    </td>
		                    <td>
		                        <form action="${pageContext.request.contextPath}/UpdateUserStatusServlet" method="post">
		                            <input type="hidden" name="userId" value="${user.userId}">
		                            <c:choose>
		                                <c:when test="${user.active == 1}">
		                                    <input type="hidden" name="status" value="0">
		                                    <button type="submit" class="btn-deactivate">Deactivate</button>
		                                </c:when>
		                                <c:otherwise>
		                                    <input type="hidden" name="status" value="1">
		                                    <button type="submit" class="btn-activate">Activate</button>
		                                </c:otherwise>
		                            </c:choose>
		                        </form>
		                    </td>
		                </tr>
		            </c:forEach>
		        </tbody>
		    </table>
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