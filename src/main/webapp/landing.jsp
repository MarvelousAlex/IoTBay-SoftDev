<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import= "Model.dao.*"%>
<%@ page import="java.sql.SQLException" %>


<%
    DAO db = (DAO)session.getAttribute("db");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IoTBay | Smart Solutions for a Connected World</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
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
        .nunito-bold {
            font-family: 'Nunito', sans-serif;
            font-weight: 700;
        }
        .nunito-semibold {
            font-family: 'Nunito', sans-serif;
            font-weight: 600;
        }
        .nunito-regular {
            font-family: 'Nunito', sans-serif;
            font-weight: 400;
        }
    </style>
</head>
<body class="font-sans antialiased text-gray-800">

<!-- Hero Section -->
<div class="hero-gradient">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-20 md:py-32">
        <div class="lg:grid lg:grid-cols-2 lg:gap-8 items-center">
            <div class="text-center lg:text-left">
                <h1 class="text-4xl md:text-5xl lg:text-6xl font-extrabold nunito-bold text-white tracking-tight">
                    Welcome to <span class="block">IoTBay</span>
                </h1>
                <p class="mt-5 max-w-md mx-auto lg:mx-0 text-xl text-indigo-100 nunito-semibold">
                    Online supply chain for electronic devices
                </p>
                <div class="mt-10 flex flex-col sm:flex-row justify-center lg:justify-start space-y-4 sm:space-y-0 sm:space-x-4 nunito-semibold">
                    <a href="login.jsp" class="btn-hover px-8 py-4 border border-transparent text-base font-medium rounded-md text-indigo-600 bg-white hover:bg-gray-50 shadow-lg focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 nunito-semibold">
                        Sign In <i class="fa-solid fa-mug-hot"></i>
                    </a>
                    <a href="Register.jsp" class="btn-hover px-8 py-4 border border-transparent text-base font-medium rounded-md text-white bg-indigo-500 hover:bg-indigo-600 shadow-lg focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-white nunito-semibold">
                        Register <i class="fa-solid fa-paper-plane"></i>
                    </a>
                    <a href="staffLogin.jsp" class="btn-hover px-10 py-4 border border-transparent text-base font-medium rounded-md text-white bg-indigo-500 hover:bg-indigo-600 shadow-lg focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-white nunito-semibold">
                        Admin <i class="fa-solid fa-circle-user"></i>
                    </a>
                </div>
            </div>
            <div class="mt-16 lg:mt-0 flex justify-center">
                <div class="device-animation">
                    <img src="https://cdn-icons-png.flaticon.com/512/2906/2906274.png" alt="IoT Devices" class="h-64 w-64">
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Features Section -->
<div class="py-16 bg-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center">
            <h2 class="text-3xl font-extrabold nunito-bold text-gray-900 sm:text-4xl">
                Powerful IoT Management
            </h2>
            <p class="mt-4 max-w-2xl text-xl text-gray-500 mx-auto nunito-regular whitespace-nowrap">
                Connect, monitor, and control all your IoT devices from one intuitive platform.
            </p>
        </div>
    </div>
</div>
</body>
<!-- Footer -->
<footer class="bg-white py-4">
    <div class="max-w-7xl mx-auto px-4 text-center">
        <p class="text-gray-900 nunito-bold">
            <i class="fas fa-copyright mr-1"></i>
            Project IoTBay, created by Wende
        </p>
    </div>
</footer>
</html>