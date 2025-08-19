<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% if (session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) {
    response.sendRedirect("login.jsp");
} %>
<html>
<head>
    <title>Help - Pahana Edu</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<h2>Help Section</h2>
<p>Welcome to the Pahana Edu Bookshop System. This system allows you to:</p>
<ul>
    <li><strong>Add New Customer:</strong> Register a new customer with account number, name, address, telephone, and units consumed.</li>
    <li><strong>View/Edit Customers:</strong> List all customers and update their details.</li>
    <li><strong>Add Item:</strong> Add a new book or product with name, price, and stock quantity.</li>
    <li><strong>Manage Items:</strong> View, edit, or delete items from the inventory.</li>
    <li><strong>Calculate Bill:</strong> Generate a bill based on the units consumed by a customer (rate: $10 per unit).</li>
    <li><strong>Logout:</strong> Exit the system securely.</li>
</ul>
<p>For support, contact Pahana Edu at support@pahanaedu.com.</p>
<a href="dashboard.jsp" class="btn">Back to Dashboard</a>
</body>
</html>