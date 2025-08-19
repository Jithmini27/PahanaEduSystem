<<<<<<< Updated upstream
<%--
  Created by IntelliJ IDEA.
  User: jithm
  Date: 8/16/2025
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
=======
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% if (session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) {
    response.sendRedirect("login.jsp");
} %>
<html>
<head>
    <title>Dashboard - Pahana Edu</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
    <div class="container">
        <div class="logo">
            <img src="img/logo.png" alt="Pahana Edu" onerror="this.replaceWith('Pahana Edu')">
        </div>
        <nav>
            <a href="dashboard.jsp">Home</a>
            <a href="logout">Logout</a>
        </nav>
    </div>
</header>
<main>
    <div class="container">
        <h2>Dashboard</h2>
        <p>Welcome, <%= ((com.pahanaedu.model.User) session.getAttribute("user")).getUsername() %>!</p>
        <div class="dashboard-cards">
            <div class="dashboard-card">
                <a href="addCustomer.jsp">
                    <span class="icon">👤</span>
                    Add New Customer
                </a>
            </div>
            <div class="dashboard-card">
                <a href="customerList">
                    <span class="icon">📋</span>
                    View/Edit Customers
                </a>
            </div>
            <div class="dashboard-card">
                <a href="addItem.jsp">
                    <span class="icon">📚</span>
                    Add Item
                </a>
            </div>
            <div class="dashboard-card">
                <a href="itemList">
                    <span class="icon">🛠️</span>
                    Manage Items
                </a>
            </div>
            <div class="dashboard-card">
                <a href="billForm.jsp">
                    <span class="icon">💸</span>
                    Calculate Bill
                </a>
            </div>
            <div class="dashboard-card">
                <a href="help.jsp">
                    <span class="icon">❓</span>
                    Help
                </a>
            </div>
        </div>
    </div>
</main>
<footer>
    <div class="container">
        <p>&copy; 2025 Pahana Edu. All rights reserved.</p>
    </div>
</footer>
</body>
</html>
>>>>>>> Stashed changes
