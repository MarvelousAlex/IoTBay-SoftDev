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
</head>

<body>
<div class="header" style="border-bottom: 1px solid #a7a7a7">
  <!-- Logo -->
  <a href="../index.jsp">
  </a>
</div>

<div class="content">
  <div class="title"><h2>Login</h2></div>

  <%--Login Form--%>
  <form action="<%= request.getContextPath() %>/LoginServlet" method="post">
    <label for="email">Email Address</label>
    <input id="email" name="email" type="text" placeholder="Email@site.com" required/>

    <label for="password">Password</label>
    <input id="password" name="password" type="password" placeholder="Your password" required/>

    <%
      String errorMessage = (String) session.getAttribute("errorMessage");
      if (errorMessage != null) {
    %>
    <p id="errorMsg" style="color: red;"><%= errorMessage %>!</p>
    <%
      }
    %>

    <input id="loginBtn" type="submit" value="Login" style="cursor: pointer;"/>
  </form>

  <a href="register.jsp" class="visibleLink">Create an account?</a>
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

</div>
</body>

</html>
