<<<<<<< Updated upstream
<<<<<<< Updated upstream
<%--
  Created by IntelliJ IDEA.
  User: jithm
  Date: 8/16/2025
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
=======
=======
>>>>>>> Stashed changes
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% if (session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) {
    response.sendRedirect("login.jsp");
} %>
<html>
<head>
    <title>Dashboard - Pahana Edu</title>

    <style>
        /* Container for centered content */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 1.5rem;
        }
        /* Header styling */
        header {
            background: linear-gradient(to right, #1e3a8a, #1e40af);
            color: #e0f2fe;
            width: 100%;
            padding: 1rem;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        header .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
        }
        .logo {
            display: flex;
            align-items: center;
            flex-direction: column;
        }
        .logo img {
            max-height: 50px;
            margin-bottom: 0.5rem;
        }
        .welcome-header {
            font-size: 1.2rem;
            font-weight: 600;
            color: #e0f2fe;
            background: linear-gradient( #1e3a8a, #60a5fa);
            -webkit-background-clip: text;

            text-align: center;
        }
        nav a {
            margin-left: 1.5rem;
            text-decoration: none;
            color: #e0f2fe;
            font-weight: 500;
            transition: background 0.3s ease;
        }
        nav a:hover {
            background: #93c5fd;
            padding: 0.25rem 0.5rem;
            border-radius: 4px;
        }
        /* Main content */
        main {
            min-height: calc(100vh - 200px);
        }
        .welcome-message {
            text-align: center;
            background-color: #f0f9ff;
            padding: 1rem;
            border-radius: 6px;
            margin: 1rem 0;
            color: #1e3a8a;
            font-size: 1.1rem;
            font-weight: 500;
        }
        /* Dashboard cards */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin: 2rem 0;
        }
        .dashboard-card {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            overflow: hidden;
        }
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
        .dashboard-card a {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 1.5rem;
            text-decoration: none;
            color: #e0f2fe;
            background: linear-gradient(to right, #1e3a8a, #1e40af);
            text-align: center;
            font-size: 1.1rem;
            font-weight: 500;
            height: 100%;
            transition: background 0.3s ease;
        }
        .dashboard-card a:hover {
            background: #93c5fd;
        }
        .dashboard-card .icon {
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }
        /* Footer */
        footer {
            background: linear-gradient(to right, #1e3a8a, #1e40af);
            padding: 2rem;
            text-align: center;
            color: #e0f2fe;
            font-size: 1.2rem;
            font-weight: 600;
            box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.2);
            border-top: 3px solid #60a5fa;
        }
        footer p {
            margin: 0.5rem 0;
        }
        .footer-secondary {
            font-size: 1rem;
            font-style: italic;
        }
        /* Responsive design */
        @media screen and (max-width: 768px) {
            .container {
                padding: 1rem;
            }
            header .container {
                flex-direction: column;
                align-items: flex-start;
            }
            nav a {
                margin: 0.5rem 0;
            }
            .dashboard-cards {
                grid-template-columns: 1fr;
            }
        }
        /* Enhanced title styling */
        h2 {
            font-size: 2.5rem;
            font-weight: 700;
            color: #1e3a8a; /* Navy blue */
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
<header class="no-print">
    <div class="container">
        <div class="logo">
            <img src="img/logo.png" alt="Pahana Edu" onerror="this.replaceWith('Pahana Edu')">
            <div class="welcome-header">Welcome to Pahana Edu Bookshop</div>
        </div>
        <nav>
            <a href="dashboard.jsp">Home</a>
            <a href="login.jsp">Logout</a>
        </nav>
    </div>
</header>
<main>
    <div class="container">
        <h2>Dashboard</h2>
        <p class="welcome-message">Welcome, <%= ((com.pahanaedu.model.User) session.getAttribute("user")).getUsername() %>!</p>
        <div class="dashboard-cards">
            <div class="dashboard-card">
                <a href="addCustomer.jsp">
                    <span class="icon">👤</span>
                    Add New Customer
                </a>
            </div>
            <div class="dashboard-card">
                <a href="customerList">
                    <span class="icon">📋</span>
                    Manage Customers
                </a>
            </div>
            <div class="dashboard-card">
                <a href="addItem.jsp">
                    <span class="icon">📚</span>
                    Add Item
                </a>
            </div>
            <div class="dashboard-card">
                <a href="itemList">
                    <span class="icon">🛠️</span>
                    Manage Items
                </a>
            </div>
            <div class="dashboard-card">
                <a href="billForm.jsp">
                    <span class="icon">🛒</span>
                    Add Purchase
                </a>
            </div>

            <div class="dashboard-card">
                <a href="bill?action=list">
                    <span class="icon">📄</span>
                    View Saved Bills
                </a>
            </div>
            <div class="dashboard-card">
                <a href="promotions.jsp">
                    <span class="icon">🏷️</span>
                    Promotions
                </a>
            </div>
            <div class="dashboard-card">
                <a href="help.jsp">
                    <span class="icon">❓</span>
                    Help
                </a>
            </div>
        </div>
    </div>
</main>
<footer>
    <div class="container">
        <p>&copy; 2025 Pahana Edu. All rights reserved.</p>
        <p class="footer-secondary">Pahana Edu Bookshop - Empowering Knowledge</p>
    </div>
</footer>
</body>
<<<<<<< Updated upstream
</html>
>>>>>>> Stashed changes
=======
</html>
>>>>>>> Stashed changes
