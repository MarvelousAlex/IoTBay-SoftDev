<%@ page import="Model.User" %>
<%@page import= "Model.dao.DBManager"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  User user = (User)session.getAttribute("loggedInUser");
  if (user == null) {
    response.sendRedirect("login.jsp"); // or wherever your login page is
    return;
  }
%>

<html>
<body>

<pref-header></pref-header>
<div class="content">
  <div class="main-header">
    <h1>EDIT DETAILS</h1>
    <p>KEEP YOUR PASSWORD SECURE</p>
  </div>
  <div class="main-content">
    <form action="/EditDetailsServlet" method="post">
      <label for="email">Email</label>
      <input id="email" name="email" type="text" value="<%=user.getEmail()%>">

      <label for="password">Password</label>
      <input id="password" name="password" type="password" value="<%=user.getPassword()%>">

      <br>
      <input id="edit" type="submit" value="Save">
    </form>
    <div class="user-box">
      <form method="POST" action="/DeleteServlet">
        <button>Delete my Account</button>
      </form>
    </div>
  </div>
</div>
<pref-footer></pref-footer>
</body>
</html>
