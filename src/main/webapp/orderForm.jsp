<%@ page import="Model.Order" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    // Redirect to login if no user is in session
    if (session.getAttribute("loggedInUser") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Grab the Order object your servlet put into the request (or make a new one)
    Order order = (Order) request.getAttribute("order");
    if (order == null) {
        order = new Order();  // uses your no-arg constructor
    }

    // Decide whether this is a NEW or EDIT form
    boolean isNew = (order.getId() == 0);

    // Build the correct form action URL, including context path
    String cp     = request.getContextPath();
    String action = isNew
            ? (cp + "/orders/create")
            : (cp + "/orders/edit?id=" + order.getId());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= isNew ? "New Order" : "Edit Order" %> | IoTBay</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-gray-50 flex items-center justify-center p-4">
<div class="w-full max-w-lg bg-white rounded-lg shadow-md p-8">
    <h1 class="text-2xl font-bold mb-6 text-gray-800">
        <%= isNew ? "Create New Order" : "Edit Order #" + order.getId() %>
    </h1>
    <form action="<%= action %>" method="post" class="space-y-4">
        <!-- Product -->
        <div>
            <label for="product" class="block text-sm font-medium text-gray-700 mb-1">Product</label>
            <input
                    id="product"
                    name="product"
                    type="text"
                    value="<%= order.getProduct() != null ? order.getProduct() : "" %>"
                    required
                    class="w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500"
            />
        </div>

        <!-- Quantity -->
        <div>
            <label for="quantity" class="block text-sm font-medium text-gray-700 mb-1">Quantity</label>
            <input
                    id="quantity"
                    name="quantity"
                    type="number"
                    min="1"
                    value="<%= order.getQuantity() %>"
                    required
                    class="w-24 border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500"
            />
        </div>

        <!-- Order Date -->
        <div>
            <label for="orderDate" class="block text-sm font-medium text-gray-700 mb-1">Order Date</label>
            <input
                    id="orderDate"
                    name="orderDate"
                    type="date"
                    value="<%= order.getOrderDate() != null ? order.getOrderDate() : "" %>"
                    required
                    class="w-48 border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500"
            />
        </div>

        <!-- Status -->
        <div>
            <label for="status" class="block text-sm font-medium text-gray-700 mb-1">Status</label>
            <select
                    id="status"
                    name="status"
                    required
                    class="w-48 border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500"
            >
                <option value="SAVED"     <%= "SAVED".equals(order.getStatus())     ? "selected" : "" %>>Saved</option>
                <option value="SUBMITTED" <%= "SUBMITTED".equals(order.getStatus()) ? "selected" : "" %>>Submitted</option>
                <option value="CANCELLED" <%= "CANCELLED".equals(order.getStatus()) ? "selected" : "" %>>Cancelled</option>
            </select>
        </div>

        <!-- Buttons -->
        <div class="pt-6 flex items-center">
            <button
                    type="submit"
                    class="px-6 py-2 bg-indigo-600 text-white font-medium rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500"
            >
                <%= isNew ? "Create Order" : "Save Changes" %>
            </button>
            <a
                    href="<%= cp %>/orders"
                    class="ml-4 text-gray-600 hover:underline"
            >
                Cancel
            </a>
        </div>
    </form>
</div>
</body>
</html>
