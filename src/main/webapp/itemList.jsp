<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<% if (session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) {
    response.sendRedirect("login.jsp");
} %>
<html>
<head>
    <title>Item List - Pahana Edu</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Enhance table container  */
        .item-table {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin: 1.5rem auto;
        }
        /* Action buttons styling */
        .actions a {
            margin-right: 0.5rem;
            padding: 0.4rem 0.8rem;
            font-size: 0.85rem;
            border-radius: 4px;
            background: linear-gradient(to right, #1e3a8a, #1e40af);
            color: #e0f2fe; /* Light blue text */
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .actions a:hover {
            background: #93c5fd;
            color: #1e3a8a;
            transform: translateY(-1px);
        }
        .actions a.delete {
            background: linear-gradient(to right, #ef4444, #dc2626);
        }
        .actions a.delete:hover {
            background: #f87171;
            color: #fff;
        }
        /* Enhanced title styling */
        h2 {
            font-size: 2.5rem;
            font-weight: 700;
            color: #1e3a8a;
            background: linear-gradient(to right, #1e3a8a, #60a5fa);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-align: center;
            margin: 2rem 0 1.5rem;
            position: relative;
            padding-bottom: 0.5rem;
            animation: fadeInUp 1s ease-out;
        }
        h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: linear-gradient(to right, #1e3a8a, #60a5fa);
            border-radius: 2px;
        }
        /* Fade-in animation for title */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
<header>
    <div class="container">
        <div class="logo">
            <img src="img/logo.png" alt="Pahana Edu" onerror="this.replaceWith('Pahana Edu')">

        </div>
        <nav>
            <a href="dashboard.jsp">Home</a>
            <a href="login.jsp">Logout</a>
        </nav>
    </div>
</header>
<div class="container">
    <h2>Item List</h2>
    <div class="item-table">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${items}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.name}</td>
                    <td>${item.price}</td>
                    <td>${item.stock}</td>
                    <td class="actions">
                        <a href="editItem?id=${item.id}">Edit</a>
                        <a href="deleteItem?id=${item.id}" class="delete" onclick="return confirm('Are you sure you want to delete this item?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>
</body>
</html>