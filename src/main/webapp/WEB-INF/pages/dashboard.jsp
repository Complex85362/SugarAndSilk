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

<div class="app-wrapper">

    <aside class="sidebar">
        <div class="brand">
            <div class="brand-logo">S&S</div>
            <h2>Sugar & Silk</h2>
        </div>

        <nav class="side-nav">
            <ul>
                <li class="nav-link active"><p>Command Center</p></li>
                <li class="nav-link"><p>Orders & Sales</p></li>
                <li class="nav-link"><p>Update Menu</p></li>
                <li class="nav-link"><p>Users</p></li>
                <li class="nav-link"><p>Inbox</p></li>
                <li class="nav-link"><p>Delivery Map</p></li>
            </ul>
        </nav>

        <button class="logout-btn">Logout</button>
    </aside>

    <main class="content-body">

        <header class="main-header">
            <div class="header-text">
                <h1>Command Center</h1>
                <p>Real-time Bakery Operations</p>
            </div>

            <div class="header-tools">
                <div class="search-container">
                    <input type="text" placeholder="Search users, orders...">
                </div>
                <button class="btn-primary">+ Add New Item</button>
            </div>
        </header>

        <section class="stats-row">

            <div class="widget-card premium-white">
                <div class="widget-info">
                    <small>Today's Revenue</small>
                    <h2>$4,820.50</h2>
                </div>
            </div>

            <div class="widget-card premium-white">
                <div class="widget-info">
                    <small>Oven Schedule</small>
                    <h2 class="oven-highlight">Batch #42</h2>
                    <p>Macarons: 12m left</p>
                </div>
            </div>

            <div class="widget-card premium-white">
                <div class="widget-info">
                    <small>Active Deliveries</small>
                    <h2>8 Drivers</h2>
                    <p>4 Out / 4 Idle</p>
                </div>
            </div>

        </section>

        <section class="dashboard-grid">

            <div class="grid-left">

                <div class="glass-card">
                    <div class="card-head">
                        <h3>User Management</h3>
                    </div>

                    <table class="admin-table">
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
                                <td><span class="badge live">Active</span></td>
                                <td>
                                    <label class="switch">
                                        <input type="checkbox" checked>
                                        <span class="slider"></span>
                                    </label>
                                </td>
                            </tr>

                            <tr>
                                <td>James Sterling</td>
                                <td>james@events.com</td>
                                <td>Customer</td>
                                <td><span class="badge">Inactive</span></td>
                                <td>
                                    <label class="switch">
                                        <input type="checkbox">
                                        <span class="slider"></span>
                                    </label>
                                </td>
                            </tr>

                            <tr>
                                <td>Suzzane Harvey</td>
                                <td>suzi@harv.com</td>
                                <td>Customer</td>
                                <td><span class="badge live">Active</span></td>
                                <td>
                                    <label class="switch">
                                        <input type="checkbox" checked>
                                        <span class="slider"></span>
                                    </label>
                                </td>
                            </tr>

                            <tr>
                                <td>MJ</td>
                                <td>mj@spy.np</td>
                                <td>Cafe Owner</td>
                                <td><span class="badge live">Active</span></td>
                                <td>
                                    <label class="switch">
                                        <input type="checkbox" checked>
                                        <span class="slider"></span>
                                    </label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="glass-card">
                    <div class="card-head">
                        <h3>Menu & Inventory</h3>
                    </div>

                    <div class="menu-item">
                        <strong>Blueberry Cheesecake</strong>
                        <small>Stock: 420</small>
                        <div class="progress-bg">
                            <div class="progress-fill healthy" style="width:85%"></div>
                        </div>
                    </div>

                    <div class="menu-item">
                        <strong>Classic Croissant</strong>
                        <small>Stock: 15</small>
                        <div class="progress-bg">
                            <div class="progress-fill low" style="width:15%"></div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="grid-right">

                <div class="glass-card">
                    <h3>Inbox</h3>

                    <div class="msg-box unread">
                        <strong>Skylar Scheutt</strong>
                        <small>5m ago</small>
                        <p>Eggless 2-tier chocolate cake for Saturday?</p>
                    </div>

                    <div class="msg-box unread">
                        <strong>Hotel Shangri-La</strong>
                        <small>1h ago</small>
                        <p>Logo cookies for corporate event.</p>
                    </div>

                    <div class="msg-box">
                        <strong>Min Patricia</strong>
                        <small>2d ago</small>
                        <p>Order feedback: Perfect delivery!</p>
                    </div>

                    <div class="msg-box unread">
                        <strong>Blue Angel Cafe</strong>
                        <small>10m ago</small>
                        <p>Need 50 cupcakes for tomorrow morning.</p>
                    </div>

                    <div class="msg-box">
                        <strong>Himalayan Java</strong>
                        <small>3h ago</small>
                        <p>Can we increase weekly pastry supply?</p>
                    </div>

                    <div class="msg-box unread">
                        <strong>Event Nepal</strong>
                        <small>1d ago</small>
                        <p>Looking for dessert catering for 200 guests.</p>
                    </div>

                </div>

            </div>

        </section>

    </main>

</div>

</body>
</html>