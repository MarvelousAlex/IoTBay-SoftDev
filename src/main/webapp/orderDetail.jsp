<%@ page import="Model.Order" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    // Redirect to login if no user in session
    if (session.getAttribute("loggedInUser") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Pull the Order object loaded by OrderDetailServlet
    Order order = (Order) request.getAttribute("order");
    if (order == null) {
        // Nothing to show → back to list
        response.sendRedirect(request.getContextPath() + "/orders");
        return;
    }

    // For building absolute URLs
    String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order #<%= order.getId() %> Details | IoTBay</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-gray-50 flex items-center justify-center p-4">
<div class="w-full max-w-md bg-white rounded-lg shadow-lg p-8">
    <h1 class="text-2xl font-bold mb-6 text-gray-800">
        Order #<%= order.getId() %> Details
    </h1>
    <dl class="grid grid-cols-2 gap-y-4 gap-x-6 text-gray-700">
        <dt class="font-medium">Product:</dt>
        <dd><%= order.getProduct() %></dd>

        <dt class="font-medium">Quantity:</dt>
        <dd><%= order.getQuantity() %></dd>

        <dt class="font-medium">Order Date:</dt>
        <dd><%= order.getOrderDate() %></dd>

        <dt class="font-medium">Status:</dt>
        <dd><%= order.getStatus() %></dd>
    </dl>

    <div class="mt-8 flex justify-between">
        <a href="<%= cp %>/orders"
           class="px-4 py-2 bg-gray-200 text-gray-800 rounded hover:bg-gray-300 focus:outline-none">
            ← Back to Orders
        </a>
        <a href="<%= cp %>/orders/edit?id=<%= order.getId() %>"
           class="px-4 py-2 bg-indigo-600 text-white rounded hover:bg-indigo-700 focus:outline-none">
            Edit Order
        </a>
    </div>
</div>
</body>
</html>
