<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
    if (loggedIn == null || !loggedIn) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Add Customer - Pahana Edu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h2>Add New Customer</h2>
<form action="${pageContext.request.contextPath}/addCustomer" method="post">

    Account Number: <input type="number" name="accountNumber" required><br>
    Name: <input type="text" name="name" required><br>
    Address: <input type="text" name="address"><br>
    Telephone: <input type="text" name="telephone"><br>
    Units Consumed: <input type="number" name="unitsConsumed" value="0"><br>
    <input type="submit" value="Add Customer">
</form>
<a href="dashboard.jsp" class="btn">Back to Dashboard</a>
</body>
</html>
