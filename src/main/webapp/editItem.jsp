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
<h2>Edit Item</h2>
<form action="editItem" method="post">
    <input type="hidden" name="id" value="${item.id}">
    ID: <input type="text" value="${item.id}" disabled><br>
    Name: <input type="text" name="name" value="${item.name}" required><br>
    Price: <input type="number" step="0.01" name="price" value="${item.price}" required><br>
    Stock: <input type="number" name="stock" value="${item.stock}"><br>
    <input type="submit" value="Update Item">
</form>
<a href="itemList">Back to Item List</a>
</body>
</html>