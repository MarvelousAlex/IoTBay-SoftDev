<%--
  Created by IntelliJ IDEA.
  User: zhouwende
  Date: 20/5/2025
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Logout</title>
</head>

<%
  String userType = (String) session.getAttribute("userType");
%>

<body>
<main class="main-container">
  <div class="logo-container">
<%--    <img src="../assets/img/Logo.png" alt="Logo" class="logo">--%>
  </div>

  <div class="content-container">
    <div class="highlight-box">
      <h1 class="logout-title">Logout</h1>
    </div>

    <h2 class="logout-subtitle">Are you sure you want to log out?</h2>

    <div class="logout-options">
      <form action="<%=request.getContextPath()%>/LogoutServlet" method="post">
        <button class="button" type="submit">Yes</button>
      </form>
      <%
        if (userType.equalsIgnoreCase("customer")) {
      %>
      <button class="button" onclick="window.location.href='<%=request.getContextPath()%>/home'">No</button>
      <%
      } else if (userType.equalsIgnoreCase("staff")) {
      %>
      <button class="button" onclick="window.location.href='<%=request.getContextPath()%>/ProductManagementServlet'">No</button>
      <%
        }
      %>
    </div>
  </div>
</main>

</body>
</html>
