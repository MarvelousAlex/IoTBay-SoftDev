<%--
  Created by IntelliJ IDEA.
  User: shilpikhosla
  Date: 20/5/2025
  Time: 11:59 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment Successful</title>
</head>
<body>
<h2>✅ Payment Successful!</h2>
<p>Your payment has been processed.</p>

<form action="PaymentHistoryServlet" method="get">
    <button type="submit">View Payment History</button>
</form>

<form action="Welcome.jsp">
    <button type="submit">Continue Shopping</button>
</form>
</body>
</html>
