<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% if (session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) {
    response.sendRedirect("login.jsp");
} %>
<html>
<head>
    <title>Edit Customer - Pahana Edu</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<h2>Edit Customer</h2>
<form action="editCustomer" method="post">
    <input type="hidden" name="accountNumber" value="${customer.accountNumber}">
    Account Number: <input type="text" value="${customer.accountNumber}" disabled><br>
    Name: <input type="text" name="name" value="${customer.name}" required><br>
    Address: <input type="text" name="address" value="${customer.address}"><br>
    Telephone: <input type="text" name="telephone" value="${customer.telephone}"><br>
    Units Consumed: <input type="number" name="unitsConsumed" value="${customer.unitsConsumed}"><br>
    <input type="submit" value="Update Customer">
</form>
<a href="customerList">Back to Customer List</a>
</body>
</html>