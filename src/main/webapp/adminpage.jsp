<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.dao.DBManager,Model.RegisteredUser,java.sql.SQLException,java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IoTBay | Smart Solutions for a Connected World</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .hero-gradient {
            background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 50%, #9333ea 100%);
        }
        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }
        .btn-hover {
            transition: all 0.3s ease;
        }
        .btn-hover:hover {
            transform: translateY(-2px);
        }
        .device-animation {
            animation: float 6s ease-in-out infinite;
        }
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
            100% { transform: translateY(0px); }
        }
    </style>
</head>
<body>
<!-- Navigation -->
<nav class="bg-white shadow-sm">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">
            <div class="flex items-center">
                <div class="flex-shrink-0 flex items-center">
                    <i class="fas fa-network-wired text-indigo-600 text-2xl mr-2"></i>
                    <span class="text-xl font-bold text-indigo-600">IoTBay</span>
                </div>
            </div>
            <div class="hidden sm:ml-6 sm:flex sm:items-center space-x-8">
                <a href="#" class="text-gray-500 hover:text-gray-700 px-3 py-2 text-sm font-medium">Home</a>
                <a href="#" class="text-gray-500 hover:text-gray-700 px-3 py-2 text-sm font-medium">Shop</a>
                <a href="adminpage.jsp" class="text-gray-500 hover:text-gray-700 px-3 py-2 text-sm font-medium">Admin</a>
            </div>
            <div class="hidden sm:ml-6 sm:flex sm:items-center">
                <a href="login.jsp" class="btn-hover px-4 py-2 border border-transparent text-sm font-medium rounded-md text-indigo-600 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                    Sign In
                </a>
            </div>
            <div class="-mr-2 flex items-center sm:hidden">
                <button type="button" class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500" aria-controls="mobile-menu" aria-expanded="false">
                    <span class="sr-only">Open main menu</span>
                    <i class="fas fa-bars"></i>
                </button>
            </div>
        </div>
    </div>
</nav>

<div class="hero-gradient">
    <div class="min-h-screen flex items-center max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-20 md:py-32">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">

            <!-- Welcome panel -->
            <div class="text-center lg:text-left">
                <h1 class="text-4xl md:text-5xl lg:text-6xl font-extrabold text-white tracking-tight">
                    Staff Portal
                </h1>
                <p class="mt-4 text-lg text-white">
                    Welcome, [Insert Name]
                </p>
            </div>

            <!-- Buttons panel -->
            <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
                <a href="#"
                   class="px-6 py-4 bg-white text-indigo-600 font-medium rounded-md text-center
                  hover:bg-gray-50 shadow-lg focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                    Shilpis Part
                </a>
                <a href="editAdmin.jsp"
                   class="px-6 py-4 bg-white text-indigo-600 font-medium rounded-md text-center
                  hover:bg-gray-50 shadow-lg focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                    Editor
                </a>
            </div>

        </div>
    </div>
</div>
</body>
</html>
