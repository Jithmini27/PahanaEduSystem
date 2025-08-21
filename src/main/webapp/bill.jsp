<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<% if (session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) {
    response.sendRedirect("login.jsp");
} %>
<html>
<head>
    <title>Bill for ${customer.name} - Pahana Edu</title>
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
        /* Customer details card */
        .customer-details {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
            margin: 1.5rem 0;
        }
        .customer-table {
            width: 100%;
            border-collapse: collapse;
            background-color: #f0f9ff;
        }
        .customer-table td {
            padding: 0.75rem;
            border: 1px solid #bfdbfe;
            color: #1e3a8a;
        }
        .customer-table td:first-child {
            font-weight: bold;
            color: #1e3a8a;
            width: 30%;
        }
        /* Bill table styling */
        .bill-table {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 1.5rem 0;
        }
        .bill-table th, .bill-table td {
            padding: 0.75rem;
            border: 1px solid #bfdbfe;
            color: #1e3a8a;
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
        /* Add item form styling */
        .add-item-form {
            background: linear-gradient(to bottom, #ffffff, #f0f9ff);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 1.5rem 0;
            position: relative;
            overflow: hidden;
        }
        .add-item-form::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(to right, #1e3a8a, #60a5fa);
        }
        .add-item-form th {
            background: linear-gradient(to right, #1e3a8a, #1e40af);
            color: #e0f2fe;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            padding: 0.75rem;
            text-align: center;
        }
        .add-item-form td {
            padding: 0.75rem;
        }
        .add-item-form select, .add-item-form input[type=number] {
            padding: 0.75rem;
            border: 1px solid #bfdbfe;
            border-radius: 6px;
            font-size: 1rem;
            color: #1e3a8a;
            background-color: #fff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .add-item-form select:focus, .add-item-form input[type=number]:focus {
            transform: scale(1.02);
            box-shadow: 0 0 8px rgba(30, 58, 138, 0.3);
            outline: none;
        }
        .add-item-form label {
            font-weight: 500;
            color: #1e3a8a; /* Navy blue */
            margin-right: 0.5rem;
        }
        .add-item-form input[type=submit] {
            position: relative;
            overflow: hidden;
        }
        .add-item-form input[type=submit]::after {
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
        .add-item-form input[type=submit]:hover::after {
            width: 200px;
            height: 200px;
        }
        /* Action buttons */
        .actions {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 0.5rem;
        }
        .actions input[type=submit], .actions a.delete {
            display: block;
            width: 100%;
            max-width: 100px;
            padding: 0.5rem;
            text-align: center;
            border-radius: 6px;
            font-size: 0.9rem;
            text-decoration: none;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .actions input[type=submit] {
            background: linear-gradient(to right, #1e3a8a, #1e40af);
            color: #e0f2fe;
            border: none;
            cursor: pointer;
        }
        .actions input[type=submit]:hover {
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
        /* Success message */
        .success {
            color: #38a169;
            font-weight: 500;
            text-align: center;
            background-color: #f0fff4; /* Light green */
            padding: 0.5rem;
            border-radius: 6px;
            margin: 1rem 0;
        }
        /* Bill total */
        .bill-total {
            font-size: 1.2rem;
            font-weight: 600;
            text-align: right;
            margin: 1.5rem 0;
            color: #1e3a8a;
        }
        /* Footer */
        .footer {
            text-align: center;
            margin-top: 2rem;
            font-style: italic;
            color: #1e3a8a;
        }
        /* Print styles */
        @media print {
            body {
                font-family: Arial, sans-serif;
                color: black;
                margin: 0;
                padding: 0;
            }
            header, .no-print, .customer-table, .success, .bill-table .quantity form, .bill-table .actions, .add-item-form {
                display: none;
            }
            .container {
                width: 210mm;
                max-width: 210mm;
                margin: 0 auto;
                padding: 5mm;
                box-sizing: border-box;
            }
            .print-only {
                display: block;
            }
            .logo {
                text-align: center;
                margin-bottom: 15mm;
            }
            .logo img {
                max-height: 60mm;
                width: auto;
            }
            .logo-text {
                font-size: 24pt;
                font-weight: bold;
                color: black;
            }
            h2 {
                font-size: 18pt;
                font-weight: bold;
                text-align: center;
                margin: 0 0 15mm 0;
                color: black;
                background: none;
                -webkit-text-fill-color: black;
                box-shadow: none;
            }
            h2::after {
                display: none; /* Hide underline in print */
            }
            .customer-details {
                margin: 0 0 15mm 0;
                padding: 0;
                font-size: 12pt;
                background: none;
                box-shadow: none;
            }
            .customer-details p {
                margin: 3mm 0;
                padding: 0;
                color: black;
            }
            .customer-details strong {
                display: inline-block;
                width: 40mm;
                font-weight: bold;
                color: black;
            }
            .bill-table {
                width: auto;
                border-collapse: collapse;
                margin: 0;
                padding: 0;
                border: 1px solid black;
                font-size: 12pt;
            }
            .bill-table th, .bill-table td {
                padding: 8mm;
                text-align: left;
                border: 1px solid black;
                color: black;
            }
            .bill-table th {
                background-color: #f0f0f0;
                font-weight: bold;
            }
            .bill-table .quantity .print-only {
                display: inline;
            }
            .bill-total {
                font-size: 14pt;
                font-weight: bold;
                text-align: right;
                margin-top: 15mm;
                color: black;
            }
            .footer {
                margin-top: 20mm;
                font-size: 12pt;
                color: black;
                border-top: 1px solid black;
                padding-top: 10mm;
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
        h3 {
            font-size: 1.8rem;
            font-weight: 600;
            color: #1e3a8a;
            background: linear-gradient(to right, #1e3a8a, #60a5fa);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-align: center;
            margin: 1.5rem 0;
            position: relative;
            padding-bottom: 0.5rem;
            animation: fadeInUp 1s ease-out 0.2s;
        }
        h3::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 2px;
            background: linear-gradient(to right, #1e3a8a, #60a5fa);
            border-radius: 2px;
        }
        /* Fade-in animation for titles */
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
    <div class="print-only logo">
        <img src="img/logo.png" alt="Pahana Edu" onerror="this.replaceWith(document.createTextNode('Pahana Edu Bookshop - Bill'))" class="logo-text">
    </div>
    <h2>Bill for Customer: ${customer.name}</h2>
    <c:if test="${not empty addItemSuccess}">
        <p class="success">${addItemSuccess}</p>
    </c:if>
    <c:if test="${not empty saveBillSuccess}">
        <p class="success">${saveBillSuccess}</p>
    </c:if>
    <div class="customer-details">
        <table class="customer-table no-print">
            <tr>
                <td>Account Number</td>
                <td>${customer.accountNumber}</td>
            </tr>
            <tr>
                <td>Name</td>
                <td>${customer.name}</td>
            </tr>
            <tr>
                <td>Address</td>
                <td>${customer.address}</td>
            </tr>
            <tr>
                <td>Telephone</td>
                <td>${customer.telephone}</td>
            </tr>
            <tr>
                <td>Bill Date</td>
                <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %></td>
            </tr>
        </table>
        <div class="print-only" style="display: none;">
            <p><strong>Account Number:</strong> ${customer.accountNumber}</p>
            <p><strong>Name:</strong> ${customer.name}</p>
            <p><strong>Address:</strong> ${customer.address}</p>
            <p><strong>Telephone:</strong> ${customer.telephone}</p>
            <p><strong>Bill Date:</strong> <%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %></p>
        </div>
    </div>

    <table class="add-item-form no-print">
        <thead>
        <tr>
            <th colspan="4">Add Item to Bill</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>
                <form action="addPurchase" method="post">
                    <input type="hidden" name="customerAccount" value="${customer.accountNumber}">
                    <label for="itemId">Item:</label>
                    <select name="itemId" id="itemId" required>
                        <option value="" disabled selected>-- Select Item --</option>
                        <c:forEach var="item" items="${allItems}">
                            <option value="${item.id}">${item.name} - ${item.price}</option>
                        </c:forEach>
                    </select>
            </td>
            <td>
                <label for="quantity">Quantity:</label>
                <input type="number" name="quantity" id="quantity" value="1" min="1" required>
            </td>
            <td>
                <input type="submit" value="Add Item">
                </form>
            </td>
            <td></td>
        </tr>
        </tbody>
    </table>

    <h3 class="no-print">Purchased Items</h3>
    <table class="bill-table">
        <thead>
        <c:choose>
            <c:when test="${not empty printMode}">
                <tr>
                    <th>Item Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>
            </c:when>
            <c:otherwise>
                <tr>
                    <th>Item Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                    <th class="no-print actions">Actions</th>
                </tr>
            </c:otherwise>
        </c:choose>
        </thead>
        <tbody>
        <c:forEach var="purchase" items="${purchases}">
            <tr>
                <td>${purchase.itemName}</td>
                <td>${purchase.itemPrice}</td>
                <td class="quantity">
                    <span class="print-only">${purchase.quantity}</span>
                    <form action="editPurchase" method="post" class="no-print" id="editPurchase_${purchase.id}">
                        <input type="hidden" name="id" value="${purchase.id}">
                        <input type="hidden" name="customerAccount" value="${customer.accountNumber}">
                        <input type="number" name="quantity" value="${purchase.quantity}" min="1" style="width: 60px;">
                    </form>
                </td>
                <td>${purchase.quantity * purchase.itemPrice}</td>
                <c:if test="${empty printMode}">
                    <td class="no-print actions">
                        <input type="submit" value="Update" form="editPurchase_${purchase.id}">
                        <a href="deletePurchase?id=${purchase.id}&customerAccount=${customer.accountNumber}" class="delete" onclick="return confirm('Delete this purchase?')">Delete</a>
                    </td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <p class="bill-total"><strong>Total Bill Amount:</strong> ${billAmount}</p>
    <p class="footer print-only">Thank you, come again!</p>

    <div class="no-print">
        <form action="bill" method="post">
            <input type="hidden" name="action" value="saveBill">
            <input type="hidden" name="customerAccount" value="${customer.accountNumber}">
            <input type="hidden" name="totalAmount" value="${billAmount}">
            <input type="submit" value="Save Bill">
        </form>
        <button onclick="window.print()">Print Bill</button>
        <a href="bill?action=list" class="back-link">View Saved Bills</a>
    </div>
    <script>
        window.onbeforeprint = function() {
            document.querySelectorAll('.print-only').forEach(el => el.style.display = 'inline');
        };
        window.onafterprint = function() {
            document.querySelectorAll('.print-only').forEach(el => el.style.display = 'none');
        };
    </script>
</div>
</body>
</html>