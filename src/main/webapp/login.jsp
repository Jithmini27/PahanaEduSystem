<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login - Pahana Edu</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<h2>User Authentication</h2>
<form action="login" method="post" autocomplete="off">
    Username: <input type="text" name="username" required autocomplete="off"><br>
    Password: <input type="password" name="password" required autocomplete="new-password"><br>
    <input type="submit" value="Login">
</form>

<% if (request.getAttribute("error") != null) { %>
<p class="error"><%= request.getAttribute("error") %></p>
<% } %>
</body>
</html>
