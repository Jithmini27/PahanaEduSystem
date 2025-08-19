<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% if (session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) {
    response.sendRedirect("login.jsp");
} %>
<html>
<head>
    <title>Add Item - Pahana Edu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h2>Add New Item</h2>
<form action="addItem" method="post">
    Name: <input type="text" name="name" required><br>
    Price: <input type="number" step="0.01" name="price" required><br>
    Stock: <input type="number" name="stock" value="0"><br>
    <input type="submit" value="Add Item">
</form>
<a href="dashboard.jsp" class="btn">Back to Dashboard</a>
</body>
</html>