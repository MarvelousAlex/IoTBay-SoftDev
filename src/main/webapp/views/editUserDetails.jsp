<%--
  Created by IntelliJ IDEA.
  User: zhouwende
  Date: 20/5/2025
  Time: 22:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bean.Customer" %>
<%@ page import="com.enums.State" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
  Customer customer = new Customer();
  if (session.getAttribute("loggedInUser") != null){
    customer = (Customer)session.getAttribute("loggedInUser");
  } else {
    response.sendRedirect(request.getContextPath()+"/views/login.jsp");
  }
%>
<head>
  <title>Edit Account</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/base.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/editDetails.css">
  <style>
    .form-container {
      max-width: 600px;
      margin: 40px auto;
      padding: 20px 30px;
      background-color: #f9f9f9;
      border-radius: 8px;
      font-family: Arial, sans-serif;
    }
    .details-display {
      background: #fff;
      padding: 25px 30px;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    .form-row {
      display: flex;
      gap: 20px;
      margin-bottom: 15px;
      flex-wrap: wrap;
    }
    .field label {
      font-weight: bold;
      margin-bottom: 6px;
      display: block;
    }
    .field input, .field select {
      width: 100%;
      padding: 8px 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 14px;
      box-sizing: border-box;
    }
    .field input:focus, .field select:focus {
      border-color: #007bff;
      outline: none;
      box-shadow: 0 0 5px rgba(0,123,255,0.5);
    }
    .errors {
      color: #d9534f;
      margin: 5px 0;
      font-size: 13px;
    }
    .update-options {
      margin-top: 25px;
      display: flex;
      align-items: center;
      gap: 15px;
    }
    .update-options .btn-primary {
      background-color: #007bff;
      border: none;
      color: white;
      padding: 10px 18px;
      font-size: 15px;
      border-radius: 4px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    .update-options .btn-primary:hover {
      background-color: #0056b3;
    }
    .visibleLink {
      color: #007bff;
      text-decoration: none;
      font-size: 14px;
    }
    .visibleLink:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<main class="form-container">
  <div class="details-display">
    <h1>Edit Account Details</h1>
    <form action="<%=request.getContextPath()%>/UpdateUserDetailsServlet" method="post">
      <div class="form-row">
        <div class="field">
          <label for="username">Username</label>
          <input id="username" name="username" type="text" required value="<%=customer.getUsername()%>" class="form-control">
        </div>
      </div>
      <div class="form-row">
        <%--password fields only filled out if user wants to change password - not required--%>
        <div class="field">
          <label for="password">Password</label>
          <input id="password" name="password" type="password" minlength="6" class="form-control">
        </div>
        <div class="field">
          <label for="confirmPassword">Confirm Password</label>
          <input id="confirmPassword" name="confirmPassword" type="password" minlength="6" class="form-control">
        </div>
      </div>
      <div class="form-row">
        <p style="font-size: 14px;">To update your password fill in both password fields. Otherwise, leave blank.</p>
      </div>
      <div class="form-row">
        <div class="field">
          <label for="firstName">First Name</label>
          <input id="firstName" name="firstName" type="text" required value="<%=customer.getFirstName()%>" class="form-control">
        </div>
        <div class="field">
          <label for="lastName">Last Name</label>
          <input id="lastName" name="lastName" type="text" required value="<%=customer.getLastName()%>" class="form-control">
        </div>
      </div>
      <div class="form-row">
        <div class="field">
          <label for="email">Email Address</label>
          <input id="email" name="email" type="email" required value="<%=customer.getEmail()%>" class="form-control">
        </div>
        <div class="field">
          <label for="phone">Phone Number</label>
          <input id="phone" name="phone" type="tel" required value="<%=customer.getPhone()%>" class="form-control">
        </div>
      </div>
      <div class="form-row">
        <div class="field">
          <label for="address">Street</label>
          <input id="address" name="address" type="text" required value="<%=customer.getAddress()%>" class="form-control">
        </div>
        <div class="field">
          <label for="city">City</label>
          <input id="city" name="city" type="text" required value="<%=customer.getCity()%>" class="form-control">
        </div>
      </div>
      <div class="form-row">
        <div class="field">
          <label for="postcode">Postcode</label>
          <input id="postcode" name="postcode" type="number" required value="<%=customer.getPostcode()%>" class="form-control">
        </div>
        <div class="field">
          <label for="country">Country</label>
          <input id="country" name="country" type="text" required value="<%=customer.getCountry()%>" class="form-control">
        </div>
      </div>
      <div class="form-row">
        <div class="field state-label">
          <label for="state">State</label>
          <select id="state" name="state" class="form-control">
            <option><%=customer.getState()%></option>
            <%
              for (State state : State.values()) {
            %>
            <option value="<%=state.getName()%>">
              <%=state.getName()%>
            </option>
            <%
              }
            %>
          </select>
        </div>
      </div>
      <%
        // display list of all errors after update details attempt
        Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");

        if (errors != null) {
      %>
      <span class="errors">Could not update details:</span><br>
      <%
        for (Map.Entry<String, String> entry : errors.entrySet()) {
      %>
      <span class="errors"><%=entry.getValue()%>!</span><br>
      <%
          }
        }
      %>
      <div class="update-options">
        <button class="button btn-primary" type="submit">Update</button>
        <a href="<%=request.getContextPath()%>/ViewUserDetailsServlet" class="visibleLink">Return without editing?</a>
      </div>
    </form>
  </div>

</main>
</body>
</html>
