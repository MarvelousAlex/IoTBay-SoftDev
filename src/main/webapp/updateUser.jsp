<%--
  Created by IntelliJ IDEA.
  User: zhouwende
  Date: 14/5/2025
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="Model.User" %>
<%@ page import="Model.dao.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  User user = (User)session.getAttribute("loggedInUser");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Profile Update Form</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>

    a {
      color: #fff;
      text-decoration: none;
      background: linear-gradient(90deg, #ff6ec4, #7873f5);
      background-clip: text;
      -webkit-background-clip: text;
      color: transparent;
      transition: text-shadow 0.3s ease-in-out;
    }

    a:hover {
      text-shadow: 0 0 10px #ff6ec4, 0 0 20px #7873f5;
    }

    .input-highlight {
      transition: all 0.3s ease;
    }
    .input-highlight:focus {
      box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.3);
      border-color: #3b82f6;
    }
    .password-toggle {
      cursor: pointer;
      transition: all 0.2s ease;
    }
    .password-toggle:hover {
      color: #3b82f6;
    }
    .shake {
      animation: shake 0.5s;
    }
    @keyframes shake {
      0%, 100% { transform: translateX(0); }
      20%, 60% { transform: translateX(-5px); }
      40%, 80% { transform: translateX(5px); }
    }
  </style>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center p-4">
<div class="w-full max-w-md">
  <div class="bg-white rounded-xl shadow-2xl overflow-hidden">
    <!-- Header -->
    <div class="bg-gradient-to-r from-blue-500 to-indigo-600 p-6 text-white">
      <div class="flex items-center space-x-4">
        <div class="bg-white/20 p-3 rounded-full">
          <i class="fas fa-user-edit text-xl"></i>
        </div>
        <div>
          <h1 class="text-2xl font-bold">Update Profile</h1>
          <p class="text-blue-100">Keep your information up to date</p>
        </div>
      </div>
    </div>

    <form action="UpdateServlet" method="post" id="profileForm" class="max-w-md mx-auto p-6 bg-white rounded-lg shadow-md space-y-6">
      <!-- Full Name Field -->
      <div>
        <label for="name" class="block text-sm font-medium text-gray-700">Full Name</label>
        <div class="relative mt-1">
          <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
            <i class="fas fa-user text-gray-400"></i>
          </div>
          <input
                  id="name"
                  name="name"
                  type="text"
                  value="<%=user.getName()%>"
                  class="pl-10 pr-4 py-2 w-full border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  placeholder="Enter your full name"
          />
        </div>
        <p id="nameError" class="mt-1 text-red-500 text-sm hidden">Please enter a valid name</p>
      </div>

      <!-- Email Address Field -->
      <div>
        <label for="email" class="block text-sm font-medium text-gray-700">Email Address</label>
        <div class="relative mt-1">
          <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
            <i class="fas fa-envelope text-gray-400"></i>
          </div>
          <input
                  id="email"
                  name="email"
                  type="email"
                  value="<%=user.getEmail()%>"
                  class="pl-10 pr-4 py-2 w-full border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  placeholder="Enter your email address"
          />
        </div>
        <p id="emailError" class="mt-1 text-red-500 text-sm hidden">Please enter a valid email address</p>
      </div>

      <!-- Password Field -->
      <div>
        <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
        <div class="relative mt-1">
          <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
            <i class="fas fa-lock text-gray-400"></i>
          </div>
          <input
                  id="password"
                  name="password"
                  type="password"
                  value="<%=user.getPassword()%>"
                  class="pl-10 pr-4 py-2 w-full border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  placeholder="Enter your password"
          />
        </div>
      </div>

      <!-- Submit Button -->
      <div class="pt-4">
        <button
                type="submit"
                class="w-full bg-blue-600 text-white font-semibold py-2 px-4 rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500"
        >
          Update Profile
        </button>
      </div>
    </form>


  <!-- Success Modal -->
  <div id="successModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center hidden z-50">
    <div class="bg-white rounded-xl p-6 max-w-sm w-full mx-4 text-center">
      <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
        <i class="fas fa-check text-green-600 text-2xl"></i>
      </div>
      <h3 class="text-lg font-medium text-gray-900 mb-2">Profile Updated!</h3>
      <p class="text-gray-500 mb-6">Your profile information has been successfully updated.</p>
      <button
              type="button"
              class="w-full px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
              id="modalCloseBtn"
      >
        Continue
      </button>
    </div>
  </div>
</div>
</body>
</html>
