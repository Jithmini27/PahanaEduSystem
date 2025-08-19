<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error - Pahana Edu</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<h2>Error</h2>
<p class="error">
    <% if (request.getAttribute("error") != null) { %>
    <%= request.getAttribute("error") %>
    <% } else { %>
    An unexpected error occurred.
    <% } %>
</p>
<a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>