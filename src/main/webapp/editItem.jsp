<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<% if (session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) {
    response.sendRedirect("login.jsp");
} %>
<html>
<head>
    <title>Edit Item - Pahana Edu</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
    <h2>Edit Item</h2>
    <form action="editItem" method="post">
        <input type="hidden" name="id" value="${item.id}">
        <label>Item ID:</label>
        <input type="text" value="${item.id}" disabled><br>
        <label>Name:</label>
        <input type="text" name="name" value="${item.name}" required><br>
        <label>Price:</label>
        <input type="number" name="price" value="${item.price}" step="0.01" min="00" required><br>
        <label>Stock:</label>
        <input type="number" name="stock" value="${item.stock}" min="0" required><br>
        <input type="submit" value="Update Item">
    </form>
    <a href="itemList" class="back-link">Back to Item List</a>
</div>
</body>
</html>