<%--
  Created by IntelliJ IDEA.
  User: shilpikhosla
  Date: 20/5/2025
  Time: 10:29 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment | IoTBay</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800 min-h-screen flex items-center justify-center">
    <div class="bg-white shadow-lg rounded-lg p-8 w-full max-w-md">
        <h2 class="text-2xl font-bold mb-6 text-center">Payment Information</h2>
        <form action="PaymentServlet" method="post" class="space-y-4">
            <div>
                <label for="method" class="block text-sm font-medium text-gray-700">Payment Method</label>
                <select id="method" name="method" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
                    <option value="" disabled selected>Select Payment Method</option>
                    <option value="Credit Card">Credit Card</option>
                    <option value="Bank Account">Bank Account</option>
                    <option value="AfterPay">AfterPay</option>
                </select>
            </div>
            <div id="creditCardFields" style="display:none;" class="space-y-4">
                <div>
                    <label for="cardNumber" class="block text-sm font-medium text-gray-700">Card Number</label>
                    <input type="text" id="cardNumber" name="cardNumber" pattern="\d{10}" maxlength="10"
                           class="mt-1 block w-full border-gray-300 rounded-md shadow-sm" required>
                </div>
                <div>
                    <label for="cvv" class="block text-sm font-medium text-gray-700">CVV</label>
                    <div class="relative">
                        <input type="password" id="cvv" name="cvv" pattern="\d{3}" maxlength="3"
                               class="mt-1 block w-full border-gray-300 rounded-md shadow-sm pr-10" required>
                        <button type="button" onclick="toggleVisibility('cvv')" class="absolute inset-y-0 right-0 px-2 text-sm text-blue-600">👁</button>
                    </div>
                </div>
                <div>
                    <label for="expiry" class="block text-sm font-medium text-gray-700">Expiry (MM/YY)</label>
                    <input type="text" id="expiry" name="expiry" pattern="(0[1-9]|1[0-2])\/\d{2}"
                           placeholder="MM/YY"
                           class="mt-1 block w-full border-gray-300 rounded-md shadow-sm" required>
                </div>
            </div>
            <div id="bankFields" style="display:none;" class="space-y-4">
                <div>
                    <label for="bsb" class="block text-sm font-medium text-gray-700">BSB Number</label>
                    <input type="text" id="bsb" name="bsb" pattern="\d{6}" maxlength="6"
                           class="mt-1 block w-full border-gray-300 rounded-md shadow-sm" required>
                </div>
                <div>
                    <label for="accountNumber" class="block text-sm font-medium text-gray-700">Account Number</label>
                    <input type="text" id="accountNumber" name="accountNumber" pattern="\d{8}" maxlength="8"
                           class="mt-1 block w-full border-gray-300 rounded-md shadow-sm" required>
                </div>
                <div>
                    <label for="pin" class="block text-sm font-medium text-gray-700">PIN</label>
                    <div class="relative">
                        <input type="password" id="pin" name="pin" pattern="\d{4}" maxlength="4"
                               class="mt-1 block w-full border-gray-300 rounded-md shadow-sm pr-10" required>
                        <button type="button" onclick="toggleVisibility('pin')" class="absolute inset-y-0 right-0 px-2 text-sm text-blue-600">👁</button>
                    </div>
                </div>
            </div>
            <div id="afterpayNote" style="display:none;" class="text-sm text-gray-600 italic">
                You will be redirected to the AfterPay website to complete your payment.
            </div>
            <!-- Hidden fields for amount and date -->
            <input type="hidden" name="amount" id="amount" value="<%= session.getAttribute("cartTotal") %>">
            <input type="hidden" name="date" id="date" value="<%= java.time.LocalDate.now() %>">
            <div class="flex items-center">
                <input id="saveMethod" name="saveMethod" type="checkbox" class="h-4 w-4 text-blue-600 border-gray-300 rounded">
                <label for="saveMethod" class="ml-2 block text-sm text-gray-900">
                    Save this payment method for future use
                </label>
            </div>
            <div>
                <button type="submit" class="w-full bg-blue-600 text-white font-semibold py-2 px-4 rounded-lg hover:bg-blue-700 transition">
                    Pay Now
                </button>
            </div>
        </form>
    </div>
    <script>
        const methodSelect = document.getElementById("method");
        const creditCardFields = document.getElementById("creditCardFields");
        const bankFields = document.getElementById("bankFields");
        const afterpayNote = document.getElementById("afterpayNote");

        methodSelect.addEventListener("change", function () {
            creditCardFields.style.display = "none";
            bankFields.style.display = "none";
            afterpayNote.style.display = "none";

            if (this.value === "Credit Card") {
                creditCardFields.style.display = "block";
            } else if (this.value === "Bank Account") {
                bankFields.style.display = "block";
            } else if (this.value === "AfterPay") {
                afterpayNote.style.display = "block";
            }
        });
</script>
<script>
    function toggleVisibility(id) {
        const input = document.getElementById(id);
        input.type = input.type === 'password' ? 'text' : 'password';
    }
</script>
</body>
</html>
