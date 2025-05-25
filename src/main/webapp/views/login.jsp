<%--
  Created by IntelliJ IDEA.
  User: zhouwende
  Date: 20/5/2025
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
  <title>Login</title>
  <style>
    .site-header {
      border-bottom: 1px solid #a7a7a7;
      padding: 10px 0;
    }
    .form-container {
      max-width: 400px;
      margin: 40px auto;
      padding: 20px;
      font-family: Arial, sans-serif;
    }
    .form-header {
      margin-bottom: 20px;
      text-align: center;
    }
    label {
      display: block;
      margin-bottom: 8px;
      font-weight: bold;
    }
    .form-control {
      width: 100%;
      padding: 8px 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }
    button[type="submit"] {
      width: 100%;
      padding: 10px;
      background-color: #007bff;
      border: none;
      color: white;
      font-size: 16px;
      border-radius: 4px;
      cursor: pointer;
    }
    button[type="submit"]:hover {
      background-color: #0056b3;
    }
    .visibleLink {
      display: block;
      margin-top: 15px;
      text-align: center;
      color: #007bff;
      text-decoration: none;
    }
    .visibleLink:hover {
      text-decoration: underline;
    }
    .site-footer {
      padding: 20px 0;
      font-size: 14px;
      color: #555;
    }
  </style>
</head>

<body>
<header class="site-header">
  <!-- Logo -->
  <a href="../landing.jsp">
  </a>
</header>

<main class="form-container">
  <div class="form-header"><h2>Login</h2></div>

  <%--Login Form--%>
  <form action="<%= request.getContextPath() %>/LoginServlet" method="post" class="login-form" novalidate>
    <label for="email">Email Address</label>
    <input id="email" name="email" type="text" placeholder="Email@site.com" required class="form-control"/>

    <label for="password">Password</label>
    <input id="password" name="password" type="password" placeholder="Your password" required class="form-control"/>

    <%
      String errorMessage = (String) session.getAttribute("errorMessage");
      if (errorMessage != null) {
    %>
    <p id="errorMsg" style="color: red;"><%= errorMessage %>!</p>
    <%
      }
    %>

    <button type="submit" class="btn btn-primary btn-block">Login</button>
  </form>

  <a href="register.jsp" class="visibleLink">Create an account?</a>
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
      <a href="/home"><span>Home</span></a>
      <a href="/productServlet"><span>Shop</span></a>
      <a href=""><span>Order</span></a>
      <a href="<%= request.getContextPath() %>/ViewPayment"><span>Payment</span></a>
    </div>
    <div class="section">
      <h6>Contact Us</h6>
      <span>Address: Hurstville, Sydney</span>
      <span>Phone Number: +61 000 000 000</span>
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

</footer>
</body>

</html>
