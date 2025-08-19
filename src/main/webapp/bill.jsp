<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<% if (session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) {
    response.sendRedirect("login.jsp");
} %>
<html>
<head>
    <title>Bill - Pahana Edu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h2>Bill Details</h2>
<c:if test="${customer != null}">
    <p><strong>Account Number:</strong> ${customer.accountNumber}</p>
    <p><strong>Name:</strong> ${customer.name}</p>
    <p><strong>Units Consumed:</strong> ${customer.unitsConsumed}</p>
    <p><strong>Bill Amount:</strong> ${billAmount}</p>
</c:if>
<a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>