<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% if (session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) {
    response.sendRedirect("login.jsp");
} %>
<html>
<head>
    <title>Calculate Bill - Pahana Edu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h2>Calculate Bill</h2>
<form action="bill" method="get">
    Account Number: <input type="number" name="accountNumber" required><br>
    <input type="submit" value="Generate Bill">
</form>
<a href="dashboard.jsp" class="btn">Back to Dashboard</a>
</body>
</html>