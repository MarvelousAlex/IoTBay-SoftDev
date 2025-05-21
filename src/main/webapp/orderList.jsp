<%@ page import="Model.Order, java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
  // Auth guard
  if (session.getAttribute("loggedInUser") == null) {
    response.sendRedirect("login.jsp");
    return;
  }

  // Pull the orders list (set by your servlet)
  @SuppressWarnings("unchecked")
  List<Order> orders = (List<Order>) request.getAttribute("orders");
  if (orders == null) {
    orders = new java.util.ArrayList<>();
  }

  // Read the filter parameters so we can re-populate the form
  String idParam  = request.getParameter("id");
  String fromDate = request.getParameter("fromDate");
  String toDate   = request.getParameter("toDate");

  // For building absolute URLs
  String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Your Orders</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="p-8 bg-gray-50">

<h1 class="text-2xl font-bold mb-4">Your Orders</h1>

<!-- Search / Filter form -->
<form method="get" action="<%=cp%>/orders" class="mb-4 space-x-2">
  <input
          type="text"
          name="id"
          placeholder="Order ID"
          value="<%= idParam != null ? idParam : "" %>"
          class="border px-2 py-1"
  />

  <label>From Date:</label>
  <input
          type="date"
          name="fromDate"
          value="<%= fromDate != null ? fromDate : "" %>"
          class="border px-2 py-1"
  />

  <label>To Date:</label>
  <input
          type="date"
          name="toDate"
          value="<%= toDate != null ? toDate : "" %>"
          class="border px-2 py-1"
  />

  <button
          type="submit"
          class="px-4 py-1 bg-gray-200 rounded"
  >
    Filter
  </button>
</form>

<a href="<%=cp%>/orders/create"
   class="px-4 py-2 bg-indigo-600 text-white rounded hover:bg-indigo-700">
  + New Order
</a>

<table class="min-w-full mt-4 bg-white shadow">
  <thead class="bg-gray-100">
  <tr>
    <th class="px-4 py-2 text-center">ID</th>
    <th class="px-4 py-2 text-center">Product</th>
    <th class="px-4 py-2 text-center">Qty</th>
    <th class="px-4 py-2 text-center">Date</th>
    <th class="px-4 py-2 text-center">Status</th>
    <th class="px-4 py-2 text-center">Actions</th>
  </tr>
  </thead>
  <tbody>
  <% for (Order o : orders) { %>
  <tr class="even:bg-white odd:bg-gray-50">
    <td class="px-4 py-2 text-center"><%= o.getId() %></td>
    <td class="px-4 py-2 text-center"><%= o.getProduct() %></td>
    <td class="px-4 py-2 text-center"><%= o.getQuantity() %></td>
    <td class="px-4 py-2 text-center"><%= o.getOrderDate() %></td>
    <td class="px-4 py-2 text-center"><%= o.getStatus() %></td>
    <td class="px-4 py-2 text-center space-x-2">
      <a href="<%=cp%>/orders/view?id=<%=o.getId()%>"
         class="text-blue-600 hover:underline">View</a>
      <a href="<%=cp%>/orders/edit?id=<%=o.getId()%>"
         class="text-indigo-600 hover:underline">Edit</a>
      <% if ("SAVED".equals(o.getStatus())) { %>
      <form action="<%=cp%>/orders/submit" method="post" style="display:inline">
        <input type="hidden" name="id" value="<%=o.getId()%>"/>
        <button type="submit"
                class="text-green-600 hover:underline"
                onclick="return confirm('Submit order <%=o.getId()%>?');">
          Submit
        </button>
      </form>
      |
      <a href="<%=cp%>/orders/delete?id=<%=o.getId()%>"
         class="text-red-600 hover:underline"
         onclick="return confirm('Delete order <%=o.getId()%>?');">
        Delete
      </a>
      <% } %>
    </td>
  </tr>
  <% } %>
  </tbody>
</table>

</body>
</html>
