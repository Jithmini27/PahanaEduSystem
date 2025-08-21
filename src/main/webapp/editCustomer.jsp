<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<% if (session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) {
    response.sendRedirect("login.jsp");
} %>
<html>
<head>
    <title>Edit Customer - Pahana Edu</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
    <h2>Edit Customer</h2>
    <form action="editCustomer" method="post">
        <input type="hidden" name="accountNumber" value="${customer.accountNumber}">
        <label>Account Number:</label>
        <input type="text" value="${customer.accountNumber}" disabled><br>
        <label>Name:</label>
        <input type="text" name="name" value="${customer.name}" required><br>
        <label>Address:</label>
        <input type="text" name="address" value="${customer.address}"><br>
        <label>Telephone:</label>
        <input type="text" name="telephone" value="${customer.telephone}"><br>
        <input type="submit" value="Update Customer">
    </form>
    <a href="customerList" class="back-link">Back to Customer List</a>
</div>
</body>
</html>