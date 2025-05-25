<%--
  Created by IntelliJ IDEA.
  User: zhouwende
  Date: 20/5/2025
  Time: 22:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bean.Customer" %>
<%@ page import="com.enums.Status" %>
<%@ page import="com.util.Utils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>User Details</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/base.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/HeaderAndFooter.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/userDetails.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <style>
    .site-header {
      background-color: #f8f9fa;
      padding: 10px 20px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      border-bottom: 1px solid #dee2e6;
    }
    .site-menu {
      display: flex;
      gap: 15px;
    }
    .site-menu a {
      text-decoration: none;
      color: #333;
      font-weight: 500;
      padding: 8px 12px;
      border-radius: 4px;
    }
    .site-menu a:hover {
      background-color: #e9ecef;
    }
    .icon-menu {
      display: flex;
      gap: 20px;
      align-items: center;
    }
    .icon-menu a {
      color: #333;
      text-align: center;
      font-size: 14px;
      text-decoration: none;
    }
    .icon-menu a.selected {
      color: #007bff;
    }
    .details-display {
      margin-top: 20px;
      max-width: 800px;
      margin-left: auto;
      margin-right: auto;
    }
    .form-row {
      display: flex;
      gap: 20px;
      margin-bottom: 15px;
    }
    .field {
      flex: 1;
      display: flex;
      flex-direction: column;
    }
    .field label {
      font-weight: 600;
      margin-bottom: 5px;
    }
    .field span {
      background-color: #f1f3f5;
      padding: 8px 10px;
      border-radius: 4px;
      font-size: 14px;
    }
    .btn {
      display: inline-block;
      padding: 10px 20px;
      font-size: 14px;
      border-radius: 4px;
      text-decoration: none;
      color: #fff;
      margin-right: 10px;
      margin-top: 20px;
    }
    .btn-primary {
      background-color: #007bff;
    }
    .btn-primary:hover {
      background-color: #0069d9;
    }
    .btn-secondary {
      background-color: #6c757d;
    }
    .btn-secondary:hover {
      background-color: #5a6268;
    }
    .btn-danger {
      background-color: #dc3545;
    }
    .btn-danger:hover {
      background-color: #c82333;
    }
    .site-footer {
      background-color: #f8f9fa;
      padding: 20px;
      text-align: center;
      border-top: 1px solid #dee2e6;
      font-size: 14px;
      color: #6c757d;
    }
    .site-footer hr {
      margin: 15px 0;
    }
    .site-footer .section {
      margin-bottom: 15px;
    }
    .site-footer a {
      color: #007bff;
      text-decoration: none;
      margin-right: 10px;
    }
    .site-footer a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<%
  Customer customer = new Customer();
  if (session.getAttribute("loggedInUser") != null){
    customer = (Customer)session.getAttribute("loggedInUser");
  } else {
    session.setAttribute("errorMessage", "Please login to view your profile");
    response.sendRedirect(request.getContextPath()+"/views/login.jsp");
  }
%>
<body>
<%--Header--%>
<header class="site-header">
  <!-- Logo -->
  <a href="<%=request.getContextPath()%>/home">
    
  </a>
  <!-- menu -->
  <nav class="site-menu">
    <a href="<%= request.getContextPath()%>/home"><span>Home</span></a>
    <a href="<%= request.getContextPath() %>/productServlet"><span>Shop</span></a>
    <a href="<%= request.getContextPath() %>/viewOrder"><span>Order</span></a>
    <a href="<%= request.getContextPath() %>/ViewPayment"><span>Payment</span></a>
  </nav>

  <!-- icon menu -->
  <nav class="icon-menu">
    <a href="<%=request.getContextPath()%>/ViewUserDetailsServlet" class="selected">
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
  <h1>Your Details</h1>
  <div class="details-display">
    <div class="form-row">
      <div class="field">
        <label>Username</label>
        <span><%=customer.getUsername()%></span>
      </div>
    </div>
    <div class="form-row">
      <div class="field">
        <label>First Name</label>
        <span><%=customer.getFirstName()%></span>
      </div>
      <div class="field">
        <label>Last Name</label>
        <span><%=customer.getLastName()%></span>
      </div>
    </div>
    <div class="form-row">
      <div class="field">
        <label>Email Address</label>
        <span><%=customer.getEmail()%></span>
      </div>
    </div>
    <div class="form-row">
      <div class="field">
        <label>Phone Number</label>
        <span><%=Utils.formatPhoneNumber(customer.getPhone())%></span>
      </div>
    </div>
    <div class="form-row">
      <div class="field">
        <label>Address</label>
        <span><%=customer.getAddress()%></span>
      </div>
      <div class="field">
        <label>City</label>
        <span><%=customer.getCity()%></span>
      </div>
    </div>
    <div class="form-row">
      <div class="field">
        <label>State</label>
        <span><%=customer.getState()%></span>
      </div>
      <div class="field">
        <label>Postcode</label>
        <span><%=customer.getPostcode()%></span>
      </div>
      <div class="field">
        <label>Country</label>
        <span><%=customer.getCountry()%></span>
      </div>
    </div>
  </div>

  <div class="account-buttons">
    <a href="<%=request.getContextPath()%>/EditUserDetailsServlet" class="btn btn-primary">Edit Details</a>
    <a href="<%=request.getContextPath()%>/ViewAccessLogsServlet" class="btn btn-secondary">View Account History</a>
    <a href="<%=request.getContextPath()%>/views/deleteAccount.jsp" class="btn btn-danger">Delete Account</a>
  </div>
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
      <a href=""><span>Category</span></a>
    </div>
    <div class="section">
      <h6>Contact Us</h6>
      <span>Address: 123 IotBay, Sydney</span>
      <span>Phone Number: +61 0499999999</span>
      <span>Email Address: IotBay@example.com</span>
    </div>
    <div class="section">
      <h6>Follow Us</h6>
      <a href="https://www.instagram.com/">
        <i class="fa-brands fa-instagram fa-lg"></i>
        <span>Instagram</span>
      </a>
      <a href="https://www.facebook.com/">
        <i class="fa-brands fa-facebook fa-lg"></i>
        <span>Facebook</span>
      </a>
      <a href="https://discord.com/">
        <i class="fa-brands fa-discord fa-lg"></i>
        <span>Discord</span>
      </a>
      <a href="https://x.com/?lang=en">
        <i class="fa-brands fa-x-twitter fa-lg"></i>
        <span>Twitter</span>
      </a>
    </div>
  </div>
  <hr>
  <p>©2025. IoTBay Group 4 All Right Reserved</p>
</footer>
</body>
</html>
