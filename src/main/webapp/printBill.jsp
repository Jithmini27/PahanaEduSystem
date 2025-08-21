<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Print Bill - Pahana Edu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            color: black;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 210mm;
            max-width: 210mm;
            margin: 0 auto;
            padding: 10mm;
            box-sizing: border-box;
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
        }
        .customer-details {
            margin: 0 0 15mm 0;
            padding: 0;
            font-size: 12pt;
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
        }
        .bill-table {
            width: 100%;
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
        .bill-total {
            font-size: 14pt;
            font-weight: bold;
            text-align: right;
            margin-top: 15mm;
            color: black;
        }
        .footer {
            text-align: center;
            margin-top: 20mm;
            font-size: 12pt;
            font-style: italic;
            color: black;
            border-top: 1px solid black;
            padding-top: 10mm;
        }
        @media screen {
            .container {
                background-color: #f7fafc;
            }
            .logo-text {
                color: #5a67d8;
            }
            .customer-details p {
                color: #2d3748;
            }
            .customer-details strong {
                color: #5a67d8;
            }
        }
        @media print {
            body {
                margin: 0;
                padding: 0;
            }
            .container {
                padding: 5mm;
            }
            .logo-text {
                color: black;
            }
            .customer-details p {
                color: black;
            }
            .customer-details strong {
                color: black;
            }
            .bill-table {
                margin: 0;
                padding: 0;
            }
        }
    </style>
    <script>
        window.onload = function() { window.print(); };
    </script>
</head>
<body>
<div class="container">
    <div class="logo">
        <img src="img/logo.png" alt="Pahana Edu" onerror="this.replaceWith(document.createTextNode('Pahana Edu'))" class="logo-text">
    </div>
    <h2>Pahana Edu Bookshop - Bill</h2>

    <div class="customer-details">
        <p><strong>Account Number:</strong> ${customer.accountNumber}</p>
        <p><strong>Name:</strong> ${customer.name}</p>
        <p><strong>Address:</strong> ${customer.address}</p>
        <p><strong>Telephone:</strong> ${customer.telephone}</p>
        <p><strong>Bill Date:</strong> ${billDate}</p>
    </div>

    <table class="bill-table">
        <tr>
            <th>Item Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Subtotal</th>
        </tr>
        <c:forEach var="purchase" items="${purchases}">
            <tr>
                <td>${purchase.itemName}</td>
                <td>${purchase.itemPrice}</td>
                <td>${purchase.quantity}</td>
                <td>${purchase.quantity * purchase.itemPrice}</td>
            </tr>
        </c:forEach>
    </table>
    <p class="bill-total"><strong>Total:</strong> ${billAmount}</p>
    <p class="footer">Thank you, come again!</p>
</div>
</body>
</html>