<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% if (session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) {
    response.sendRedirect("login.jsp");
} %>
<html>
<head>
    <title>Help - Pahana Edu</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Container for centered content */
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem;
        }
        /* Header styling */
        header {
            background: linear-gradient(to right, #1e3a8a, #1e40af);
            color: #e0f2fe;
            width: 100%;
            padding: 2rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
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
        }
        .logo img {
            max-height: 60px;
        }
        nav a {
            margin-left: 2rem;
            text-decoration: none;
            color: #e0f2fe;
            font-weight: 600;
            font-size: 1.1rem;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        nav a:hover {
            background: #93c5fd;
            transform: translateY(-2px);
        }
        /* Main content */
        main {
            min-height: calc(100vh - 150px);
        }
        .help-content {
            background: #ffffff;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 2rem 0;
        }
        p {
            font-size: 1.1rem;
            color: #1e3a8a;
            margin-bottom: 1rem;
        }
        ul {
            list-style: none;
            padding: 1rem;
            background: #f0f9ff;
            border-radius: 8px;
            margin-bottom: 1.5rem;
        }
        ul li {
            font-size: 1.2rem;
            color: #1e3a8a;
            margin: 0.75rem 0;
            padding-left: 2rem;
            position: relative;
        }
        ul li::before {
            content: "➔";
            position: absolute;
            left: 0;
            color: #60a5fa;
            font-size: 1.2rem;
        }
        /* Enhanced title styling */
        h2 {
            font-size: 2.8rem;
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
            width: 120px;
            height: 4px;
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
        }
    </style>
</head>
<body>
<header class="no-print">
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
<main>
    <div class="container">
        <h2>Help Section</h2>
        <div class="help-content">
            <p>Provide system usage guidelines for new users:</p>
            <p>The Pahana Edu Bookshop System is designed to help you manage customers, inventory, and billing efficiently. Below are the key features and how to use them:</p>
            <ul>
                <li><strong>Add New Customer:</strong> Register a new customer by providing their account number, name, address, telephone, and units consumed.</li>
                <li><strong>Manage Customers:</strong> View a list of all customers and update their details as needed.</li>
                <li><strong>Add Item:</strong> Add a new book or product to the inventory with its name, price, and stock quantity.</li>
                <li><strong>Manage Items:</strong> View, edit, or delete items from the inventory to keep it up to date.</li>
                <li><strong>Add Purchase:</strong> Record a customer’s purchase by selecting items and quantities to generate a bill.</li>
                <li><strong>View Saved Bills:</strong> Access a list of all saved bills to review or edit past transactions.</li>
                <li><strong>Calculate Bill:</strong> The bill is generated based on the services or courses selected by the customer.
                    Each service has a fixed price, and the total bill is the sum of all selected services.</li>
                <li><strong>Logout:</strong> Exit the system securely to protect your session.</li>
            </ul>
            <p>For support, contact Pahana Edu at <a href="mailto:support@pahanaedu.com" style="color: #60a5fa; text-decoration: none;">support@pahanaedu.com</a>.</p>
        </div>
    </div>
</main>
</body>
</html>