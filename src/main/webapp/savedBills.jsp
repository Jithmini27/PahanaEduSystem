<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<% if (session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) {
    response.sendRedirect("login.jsp");
} %>
<html>
<head>
    <title>Saved Bills - Pahana Edu</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Container for centered content */
        .container {
            max-width: 900px;
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
        /* Bill table styling */
        .bill-table {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 1.5rem 0;
            width: 100%;
            border-collapse: collapse;
        }
        .bill-table th, .bill-table td {
            padding: 0.75rem;
            border: 1px solid #bfdbfe;
            color: #1e3a8a;
            text-align: left;
        }
        .bill-table th {
            background: linear-gradient(to right, #1e3a8a, #1e40af);
            color: #e0f2fe;
            font-weight: 600;
        }
        .bill-table tr:nth-child(even) {
            background-color: #f0f9ff;
        }
        .bill-table tr:hover {
            background-color: #dbeafe;
        }
        /* Action buttons */
        .actions {
            display: flex;
            flex-direction: row;
            align-items: center;
            gap: 0.5rem;
        }
        .actions a {
            display: block;
            width: 100%;
            max-width: 80px;
            padding: 0.5rem;
            text-align: center;
            border-radius: 6px;
            font-size: 0.85rem;
            text-decoration: none;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .actions a.edit, .actions a.print {
            background: linear-gradient(to right, #1e3a8a, #1e40af);
            color: #e0f2fe;
        }
        .actions a.edit:hover, .actions a.print:hover {
            background: #93c5fd;
            transform: translateY(-1px);
        }
        .actions a.delete {
            background: linear-gradient(to right, #ef4444, #dc2626);
            color: #fff;
        }
        .actions a.delete:hover {
            background: #f87171;
            transform: translateY(-1px);
        }
        /* Error message */
        .error {
            color: #e53e3e;
            font-weight: 500;
            text-align: center;
            background-color: #fef2f2;
            padding: 0.5rem;
            border-radius: 6px;
            margin: 1rem 0;
        }
        /* Back link */
        .back-link {
            display: inline-block;
            margin-top: 1.5rem;
            padding: 0.5rem 1rem;
            background: linear-gradient(to right, #1e3a8a, #1e40af);
            color: #e0f2fe;
            border-radius: 6px;
            text-decoration: none;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .back-link:hover {
            background: #93c5fd;
            transform: translateY(-1px);
        }
        /* Responsive design */
        @media screen and (max-width: 768px) {
            .bill-table {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }
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
            .actions {
                flex-wrap: wrap;
                justify-content: center;
            }
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
<div class="container">
    <h2>Saved Bills</h2>
    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>
    <table class="bill-table">
        <thead>
        <tr>
            <th>Bill ID</th>
            <th>Customer</th>
            <th>Total Amount</th>
            <th>Date</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="bill" items="${bills}">
            <tr>
                <td>${bill.id}</td>
                <td>${bill.customer.name} (Account: ${bill.customerId})</td>
                <td>${bill.totalAmount}</td>
                <td>${bill.billDate}</td>
                <td class="actions">
                    <a href="bill?action=editBill&id=${bill.id}" class="edit">Edit</a>
                    <a href="bill?action=deleteBill&id=${bill.id}" class="delete" onclick="return confirm('Are you sure you want to delete this bill?')">Delete</a>
                    <a href="bill?action=printBill&id=${bill.id}" class="print" target="_blank">Print</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${empty bills}">
        <p class="error">No bills found. Please save a bill first.</p>
    </c:if>
    <a href="bill.jsp" class="back-link">Back</a>
</div>
</body>
</html>