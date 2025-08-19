<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
    if (loggedIn == null || !loggedIn) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Customer List - Pahana Edu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h2>Customer Accounts</h2>



<table border="1" cellpadding="5">
    <tr>
        <th>Account</th>
        <th>Name</th>
        <th>Address</th>
        <th>Telephone</th>
        <th>Units</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="customer" items="${customers}">
        <tr>
            <td>${customer.accountNumber}</td>
            <td>${customer.name}</td>
            <td>${customer.address}</td>
            <td>${customer.telephone}</td>
            <td>${customer.unitsConsumed}</td>
            <td>
                <!-- Edit Button -->
                <form action="editCustomer" method="get" style="display:inline;">
                    <input type="hidden" name="accountNumber" value="${customer.accountNumber}">
                    <input type="submit" value="Edit">
                </form>

                <!-- Delete Button -->
                <form action="deleteCustomer" method="post" style="display:inline;">
                    <input type="hidden" name="accountNumber" value="${customer.accountNumber}">
                    <input type="submit" value="Delete" onclick="return confirm('Are you sure?');">
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- Add Customer Button -->
<form action="addCustomer.jsp" method="get" style="margin-bottom: 15px;">
    <input type="submit" value="Add New Customer">
</form>

<a href="dashboard.jsp" class="btn">Back to Dashboard</a>
</body>
</html>
