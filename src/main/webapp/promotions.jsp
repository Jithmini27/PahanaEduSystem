<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<% if (session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) {
    response.sendRedirect("login.jsp");
} %>
<html>
<head>
    <title>Promotions & Events - Pahana Edu</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Container for centered content */
        .container {
            max-width: 1200px;
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
        nav a.active {
            background: #93c5fd;
            text-decoration: underline;
            text-underline-offset: 4px;
        }
        /* Promotion section */
        .promotions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin: 2rem 0;
        }
        .promotion-card {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            position: relative;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .promotion-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(to right, #1e3a8a, #60a5fa);
        }
        .promotion-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .promotion-card h3 {
            font-size: 1.5rem;
            font-weight: 600;
            color: #1e3a8a;
            margin: 0.5rem 0;
        }
        .promotion-card p {
            color: #374151;
            font-size: 1rem;
            margin: 0.5rem 0;
        }
        /* title styling */
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
        /* Fade-in animation */
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
            .promotions {
                grid-template-columns: 1fr;
            }
            .promotion-card {
                margin: 0 auto;
                max-width: 400px;
            }
        }
        /* Print styles */
        @media print {
            body {
                font-family: Arial, sans-serif;
                color: black;
                margin: 0;
                padding: 0;
            }
            header {
                display: none;
            }
            .container {
                width: 210mm;
                max-width: 210mm;
                margin: 0 auto;
                padding: 5mm;
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
                background: none;
                -webkit-text-fill-color: black;
            }
            h2::after {
                display: none;
            }
            .promotions {
                display: block;
            }
            .promotion-card {
                margin: 0 0 10mm 0;
                padding: 5mm;
                border: 1px solid black;
                box-shadow: none;
                page-break-inside: avoid;
            }
            .promotion-card::before {
                display: none;
            }
            .promotion-card h3 {
                font-size: 14pt;
                color: black;
            }
            .promotion-card p {
                font-size: 12pt;
                color: black;
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
            <a href="promotions.jsp" class="active">Promotions</a>
            <a href="logout">Logout</a>
        </nav>
    </div>
</header>
<main>
    <div class="container">

        <h2>Promotions & Events</h2>
        <div class="promotions">
            <!-- Placeholder promotions; replace with dynamic data via servlet -->
            <div class="promotion-card">
                <h3>20% Off Textbooks</h3>
                <p>Get 20% off all textbooks for the back-to-school season! Valid until September 30, 2025.</p>
            </div>
            <div class="promotion-card">
                <h3>Buy 2 Get 1 Free</h3>
                <p>Purchase any two books and get a third one free. Mix and match your favorites!</p>
            </div>
            <div class="promotion-card">
                <h3>10% Off Stationery</h3>
                <p>Stock up on pens, notebooks, and more with 10% off all stationery items. Valid until October 15, 2025.</p>
            </div>
            <div class="promotion-card">
                <h3>Book Fair 2025</h3>
                <p>Join us for our annual Book Fair on October 15, 2025, at Pahana Edu Colombo. Discover new releases and meet authors!</p>
            </div>
            <div class="promotion-card">
                <h3>Author Meet & Greet</h3>
                <p>Meet bestselling authors at our exclusive event on November 10, 2025. Limited seats available!</p>
            </div>
            <div class="promotion-card">
                <h3>Back-to-School Workshop</h3>
                <p>Attend our free workshop on study skills and time management on September 20, 2025. Perfect for students!</p>
            </div>
            <!-- Dynamic promotions example (uncomment when servlet is implemented) -->
            <%--
            <c:forEach var="promotion" items="${promotions}">
                <div class="promotion-card">
                    <h3>${promotion.title}</h3>
                    <p>${promotion.description}</p>
                </div>
            </c:forEach>
            --%>
        </div>
    </div>
</main>
</body>
</html>