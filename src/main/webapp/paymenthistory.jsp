<%--
  Created by IntelliJ IDEA.
  User: shilpikhosla
  Date: 20/5/2025
  Time: 11:27 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment History</title>
</head>
<body>
<%@ page import="java.util.List" %>
<%@ page import="Model.Payment" %>
<%
    List<Payment> payments = (List<Payment>) request.getAttribute("payments");
%>
<div class="container mx-auto py-8">
    <h2 class="text-2xl font-bold mb-6">Your Payment History</h2>
    <table class="min-w-full bg-white shadow-md rounded-lg overflow-hidden">
        <thead class="bg-gray-200 text-gray-700">
            <tr>
                <th class="py-3 px-6 text-left">Method</th>
                <th class="py-3 px-6 text-left">Card</th>
                <th class="py-3 px-6 text-left">Amount</th>
                <th class="py-3 px-6 text-left">Date</th>
                <th class="py-3 px-6 text-left">Status</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (payments != null && !payments.isEmpty()) {
                    for (Payment p : payments) {
            %>
            <tr class="border-t border-gray-200 hover:bg-gray-50">
                <td class="py-3 px-6"><%= p.getMethod() %></td>
                <td class="py-3 px-6"><%= p.getCardNumber() %></td>
                <td class="py-3 px-6">$<%= p.getAmount() %></td>
                <td class="py-3 px-6"><%= p.getPaymentDate() %></td>
                <td class="py-3 px-6"><%= p.getStatus() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="5" class="py-4 text-center text-gray-500">No payment records found.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>
