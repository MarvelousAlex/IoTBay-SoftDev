<%--
  Created by IntelliJ IDEA.
  User: zhouwende
  Date: 20/5/2025
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bean.Customer" %>
<%@ page import="com.util.Utils" %>
<%@ page import="com.bean.Staff" %>

<html>
<%
    String userType = (String) session.getAttribute("userType");
    Customer customer = null;
    Staff staff = null;

    if (userType.equalsIgnoreCase("customer")) {
        customer = (Customer) session.getAttribute("loggedInUser");
    } else if (userType.equalsIgnoreCase("staff")) {
        staff = (Staff) session.getAttribute("loggedInUser");
    }
%>
<head>
    <title>Welcome</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
        }
        .site-header {
            background-color: #004080;
            color: white;
            padding: 15px 0;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
        }
        .welcome-container {
            max-width: 600px;
            width: 100%;
            margin: 40px auto;
            padding: 0 20px;
        }
        .welcome-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            padding: 30px;
            text-align: center;
        }
        .description {
            font-size: 16px;
            color: #555;
            margin: 15px 0 30px 0;
        }
        .style1 {
            padding: 12px 25px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }
        .style1:hover {
            background-color: #0056b3;
        }
        .site-footer {
            background-color: #004080;
            color: white;
            text-align: center;
            padding: 15px 0;
            font-size: 14px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
<header class="site-header">
    IoTBay
</header>
<main class="welcome-container">
    <div class="welcome-card">
        <!-- Banner Image -->
    <%--    <img src="../assets/img/Logo.png" alt="Welcome Banner" class="banner-img">--%>

        <!-- Welcome Message dependent on userType -->
        <%
            if (customer != null) {
        %>
        <h1>Welcome, <%= Utils.capitaliseFirst(customer.getFirstName()) %>!</h1>
        <p>Your email: <strong><%= customer.getEmail() %></strong></p>
        <p class="description">We're excited to have you join IoTBay <br> Start exploring now!</p>
        <!-- Go to Main Page -->
        <a href="<%=request.getContextPath()%>/home" class="style1">Go to Main Page</a>
        <%
        } else if (staff != null) {
        %>
        <h1>Welcome, <%=staff.getStaffName()%>!</h1>
        <p class="description">Welcome to the IoTBay System <br>  Continue to the Product Management Page</p>
        <!-- Go to Product Management Page -->
        <a href="<%=request.getContextPath()%>/ProductManagementServlet" class="style1">Go to Product Management</a>
        <%
            }
        %>

    </div>
</main>
<footer class="site-footer">
    &copy; 2025 IoTBay. All rights reserved.
</footer>
</body>
</html>
