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
</head>

<body>
<!-- header -->
<div class="header">
  <!-- Logo -->
  <a href="<%=request.getContextPath()%>/home">
    <img src="<%=request.getContextPath()%>/assets/img/Logo.png" alt="IotBay Logo">
  </a>
  <!-- menu -->
  <menu>
    <a href="<%= request.getContextPath()%>/home"><span class="selected">Home</span></a>
    <a href="<%= request.getContextPath() %>/productServlet"><span>Shop</span></a>
    <a href="<%= request.getContextPath() %>/viewOrder"><span>Order</span></a>
    <a href="<%= request.getContextPath() %>/ViewPayment"><span>Payment</span></a>
  </menu>

  <!-- icon menu -->
  <menu class="icon">
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
  </menu>
</div>


<!-- footer -->
<div class="footer">
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
</div>
</body>

</html>
