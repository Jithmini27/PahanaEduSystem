<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="com.pahanaedu.dao.CustomerDAO" %>
<%@ page import="com.pahanaedu.model.Customer" %>
<%@ page import="java.util.List" %>
<%
    // Fetch customers directly in JSP as a fallback (not ideal but avoids new servlet)
    CustomerDAO customerDAO = new CustomerDAO();
    List<Customer> customers = customerDAO.getAllCustomers();
    request.setAttribute("customers", customers);
%>
<% if (session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) {
    response.sendRedirect("login.jsp");
} %>
<html>
<head>
    <title>Calculate Bill - Pahana Edu</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Enhance form container  */
        .billing-form {
            background: linear-gradient(to bottom, #ffffff, #f0f9ff);
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            max-width: 500px;
            width: 100%;
            margin: 2rem auto;
            position: relative;
            overflow: hidden;
        }
        /* Add a subtle top border effect */
        .billing-form::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(to right, #1e3a8a, #60a5fa);
        }
        /* Floating label effect for select */
        .form-group {
            position: relative;
            margin-bottom: 1.5rem;
        }
        .form-group label {
            position: absolute;
            top: 0.75rem;
            left: 0.75rem;
            color: #93c5fd;
            font-size: 1rem;
            font-weight: 500;
            transition: all 0.3s ease;
            pointer-events: none;
        }
        .form-group select:focus + label,
        .form-group select:not([value=""]) + label {
            top: -0.75rem;
            left: 0.5rem;
            font-size: 0.8rem;
            color: #1e3a8a;
            background: #ffffff;
            padding: 0 0.25rem;
        }
        /* Select field animations */
        .form-group select {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #bfdbfe;
            border-radius: 6px;
            font-size: 1rem;
            color: #1e3a8a;
            background-color: #fff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .form-group select:focus {
            transform: scale(1.02);
            box-shadow: 0 0 8px rgba(30, 58, 138, 0.3);
            outline: none;
        }
        /* Submit button with animation */
        .billing-form input[type="submit"] {
            position: relative;
            overflow: hidden;
        }
        .billing-form input[type="submit"]::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            transform: translate(-50%, -50%);
            transition: width 0.5s ease, height 0.5s ease;
        }
        .billing-form input[type="submit"]:hover::after {
            width: 200px;
            height: 200px;
        }
        /* Error message styling */
        .error {
            color: #ef4444;
            font-size: 0.9rem;
            font-weight: 500;
            text-align: center;
            background-color: #fef2f2;
            padding: 0.5rem;
            border-radius: 6px;
            margin: 1rem 0;
        }
        /* Back link positioning */
        .back-link {
            display: block;
            text-align: center;
            margin-top: 1rem;
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
    <h2>Select Customer for Billing</h2>
    <div class="billing-form">
        <form action="bill" method="get">
            <div class="form-group">
                <select name="accountNumber" id="accountNumber" required>
                    <option value="" disabled selected>-- Select a Customer --</option>
                    <c:forEach var="customer" items="${customers}">
                        <option value="${customer.accountNumber}">${customer.name} (Account: ${customer.accountNumber})</option>
                    </c:forEach>
                </select>
                <label for="accountNumber">Select Customer</label>
            </div>
            <input type="submit" value="Load Billing Interface">
        </form>
        <c:if test="${empty customers}">
            <p class="error">No customers found. Please add a customer first.</p>
        </c:if>
    </div>

</div>
</body>
</html>