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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="cssFiles/styles.css">
</head>
<body>
<header class="header-nav">
  <nav>
    <ul class="nav-links">
      <li><a href="">Home</a></li>
      <li><a href="">Shop</a></li>
      <li><a href="">Order</a></li>
      <li><a href="">Category</a></li>
    </ul>
  </nav>
</header>
<main class="main-container">

  <h1>Welcome to IoTBay</h1>
  <div class="button-group">
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
</body>
</html>
