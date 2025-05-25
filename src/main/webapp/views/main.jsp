<%--
  Created by IntelliJ IDEA.
  User: zhouwende
  Date: 20/5/2025
  Time: 22:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bean.Customer" %>
<%@ page import="com.enums.Status" %>
<%@ page import="com.bean.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bean.Category" %>
<%@ page import="com.util.Utils" %>

<%@ page import="java.util.List" %>

<%@ page import="com.util.Utils" %>
<html>
<%
  Customer customer = new Customer();
  if (session.getAttribute("loggedInUser") != null) {
    customer = (Customer) session.getAttribute("loggedInUser");
  } else {
    customer.setUsername(Status.GUEST.getStatus());
  }
%>
<head>
  <title>IoTBay Home</title>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background-color: #f8f9fa;
      color: #333;
    }
    .site-header {
      background-color: #007bff;
      color: white;
      padding: 10px 20px;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }
    .site-menu, .icon-menu {
      display: flex;
      gap: 15px;
      align-items: center;
    }
    .site-menu a, .icon-menu a {
      color: white;
      text-decoration: none;
      font-weight: bold;
    }
    .site-menu a span.selected {
      border-bottom: 2px solid white;
    }
    .icon-menu i {
      margin-right: 5px;
    }
    .main-content {
      padding: 20px;
      min-height: 60vh;
      background-color: white;
      max-width: 1200px;
      margin: 0 auto;
    }
    .site-footer {
      background-color: #343a40;
      color: white;
      padding: 20px;
      text-align: center;
    }
    .site-footer hr {
      border-color: #495057;
    }
    .site-footer .section {
      margin-bottom: 15px;
    }
    .site-footer a {
      color: #adb5bd;
      text-decoration: none;
      margin: 0 10px;
    }
    .site-footer a:hover {
      text-decoration: underline;
    }
  </style>
</head>

<body>
<!-- header -->
<header class="site-header">
  <!-- Logo -->
  <a href="<%=request.getContextPath()%>/home">
  </a>
  <!-- menu -->
  <nav class="site-menu">
    <a href="<%= request.getContextPath()%>/home"><span class="selected">Home</span></a>
    <a href="<%= request.getContextPath() %>/productServlet"><span>Shop</span></a>
    <a href="<%= request.getContextPath() %>/viewOrder"><span>Order</span></a>
    <a href="<%= request.getContextPath() %>/ViewPayment"><span>Payment</span></a>
  </nav>

  <!-- icon menu -->
  <nav class="icon-menu">
    <a href="<%=request.getContextPath()%>/ViewUserDetailsServlet">
      <i class="fa-solid fa-circle-user fa-2x"></i>
      <span><%= customer.getFirstName() != null ? Utils.capitaliseFirst(customer.getFirstName()) : Status.GUEST.getStatus()%></span>
    </a>
    <a href="<%=request.getContextPath()%>/GetByProductNameToCustomer">
      <i class="fa-solid fa-magnifying-glass fa-2x"></i>
      <span>Search</span>
    </a>
    <a href="#">
      <i class="fa-solid fa-cart-shopping fa-2x"></i>
      <span>Cart</span>
    </a>
    <%
      if (session.getAttribute("loggedInUser") != null) {
    %>
    <a href="<%=request.getContextPath()%>/views/logout.jsp">
      <i class="fa-solid fa-right-from-bracket fa-2x"></i>
      <span>Log Out</span>
    </a>
    <%
      }
    %>
  </nav>
</header>

<main class="main-content">

</main>

<!-- footer -->
<footer class="site-footer">
  <hr>
  <div>
    <div class="section">
      <h6 id="dif">IoTBay</h6><br>
      <span>The most complete range of IoT devices to upgrade your life at the touch of a button.</span>
    </div>
    <div class="section">
      <h6>Links</h6>
      <a href="<%=request.getContextPath()%>/home"><span>Home</span></a>
      <a href="<%=request.getContextPath()%>/productServlet"><span>Shop</span></a>
      <a href="<%=request.getContextPath()%>/viewOrder"><span>Order</span></a>
      <a href="<%= request.getContextPath()%>/ViewPayment"><span>Payment</span></a>
    </div>
  </div>
  <hr>
</footer>
</body>

</html>
