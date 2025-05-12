
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>IoTBay | Smart Solutions for a Connected World</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    .hero-gradient {
      background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 50%, #9333ea 100%);
    }
    .btn-hover { transition: all 0.3s ease; }
    .btn-hover:hover { transform: translateY(-2px); }
  </style>
</head>
<body class="m-0 p-0">
<div class="hero-gradient h-screen flex items-center justify-center relative">

  <!-- Navigation (floats above) -->
  <nav class="absolute top-0 left-0 w-full bg-white bg-opacity-90 shadow-sm z-10">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex justify-between h-16 items-center">
        <div class="flex items-center">
          <i class="fas fa-network-wired text-indigo-600 text-2xl mr-2"></i>
          <span class="text-xl font-bold text-indigo-600">IoTBay</span>
        </div>
        <div class="hidden sm:flex sm:items-center space-x-8">
          <a href="#" class="text-gray-700 hover:text-gray-900 px-3 py-2 text-sm font-medium">Home</a>
          <a href="#" class="text-gray-700 hover:text-gray-900 px-3 py-2 text-sm font-medium">Shop</a>
          <a href="adminpage.jsp" class="text-gray-700 hover:text-gray-900 px-3 py-2 text-sm font-medium">Admin</a>
        </div>
        <div class="hidden sm:flex sm:items-center">
          <a href="login.jsp"
             class="btn-hover px-4 py-2 border border-transparent text-sm font-medium rounded-md
                      text-indigo-600 bg-white hover:bg-gray-50 focus:outline-none
                      focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
            Sign In
          </a>
        </div>
        <div class="sm:hidden">
          <button type="button"
                  class="p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100
                           focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500">
            <span class="sr-only">Open menu</span>
            <i class="fas fa-bars"></i>
          </button>
        </div>
      </div>
    </div>
  </nav>

  <!-- Centre-screen search bar at ~30% width -->
  <form action="#" method="get" class="relative w-[30%] px-4">
    <input
            type="text"
            name="q"
            placeholder="Search IoTBay..."
            class="w-full py-3 px-4 rounded-xl text-lg focus:outline-none
               focus:ring-4 focus:ring-white focus:ring-opacity-50"
    />
    <button
            type="submit"
            class="absolute right-4 top-1/2 transform -translate-y-1/2 text-white text-xl">
      <i class="fas fa-search"></i>
    </button>
  </form>

</div>
</body>
</html>