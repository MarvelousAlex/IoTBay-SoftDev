<%--
  Created by IntelliJ IDEA.
  User: zhouwende
  Date: 20/5/2025
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Landing Page</title>
</head>
<body>
<main class="main-container">

  <h1>Welcome to IoTBay</h1>
  <div>
    <a href="./views/login.jsp">
      <button class="button button-login">Login</button>
    </a>
    <a href="./views/register.jsp">
      <button class="button">Register</button>
    </a>
    <a href="<%= request.getContextPath()%>/AnonymousCreation">
      <button class="button">Continue as a Guest</button>
    </a>
  </div>
</main>

<div class="footer">
  <hr>
  <div>
    <div class="section">
      <h6 id="dif">IoTBay</h6><br>
      <span>The most complete range of IoT devices to upgrade your life at the touch of a button.</span>
    </div>
    <div class="section">
      <h6>Links</h6>
      <a href=""><span>Home</span></a>
      <a href=""><span>Shop</span></a>
      <a href=""><span>Order</span></a>
      <a href=""><span>Category</span></a>
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
  <p>©2025. IoTBay Group 5. Created by Wende Zhou</p>
</div>
</body>
</html>
