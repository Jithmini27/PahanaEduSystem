<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<% if (session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) {
    response.sendRedirect("login.jsp");
} %>
<html>
<head>
    <title>Edit Bill #${bill.id} - Pahana Edu</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
    <h2>Edit Bill #${bill.id}</h2>
    <form action="bill" method="post">
        <input type="hidden" name="action" value="updateBill">
        <input type="hidden" name="id" value="${bill.id}">
        <label>Customer:</label>
        <input type="text" value="${customer.name} (Account: ${bill.customerId})" disabled><br>
        <label>Total Amount:</label>
        <input type="number" name="totalAmount" value="${bill.totalAmount}" step="0.01" min="00" required><br>
        <label>Date:</label>
        <input type="text" value="${bill.billDate}" disabled><br>
        <input type="submit" value="Update Bill">
    </form>
    <a href="bill?action=list" class="back-link">Back to Saved Bills</a>
</div>
</body>
</html>