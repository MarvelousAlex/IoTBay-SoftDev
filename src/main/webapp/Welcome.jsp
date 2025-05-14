<%@ page import="Model.User" %><%
    User user = (User)session.getAttribute("loggedInUser");
    System.out.println();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome | IoTBay - IoT Devices Ordering System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .iot-gradient-bg {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        }
        .card-hover {
            transition: all 0.3s ease;
        }
        .card-hover:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        .feature-icon {
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            margin: 0 auto 20px;
            background: linear-gradient(135deg, rgba(79, 172, 254, 0.1) 0%, rgba(0, 242, 254, 0.1) 100%);
        }
        .timeline-item:not(:last-child)::after {
            content: '';
            position: absolute;
            left: 24px;
            top: 40px;
            height: calc(100% - 40px);
            width: 2px;
            background: #e2e8f0;
        }
        .animate-float {
            animation: float 6s ease-in-out infinite;
        }
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-15px); }
            100% { transform: translateY(0px); }
        }
        .iot-device-icon {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(5px);
        }
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

    </style>
    <script>
        function confirmDeleteAccount() {
            alert('Please double check whether you really want to delete your account. This action cannot be undone.');
            return confirm('Are you sure you want to delete your account?');
        }
    </script>
</head>
<body class="iot-gradient-bg min-h-screen text-gray-800">
<div class="container mx-auto px-4 py-12">
    <!-- Header -->
    <header class="text-center mb-16">
        <div class="animate-float inline-block mb-6">
            <div class="iot-device-icon p-4 rounded-full shadow-xl">
                <i class="fas fa-microchip text-4xl text-white"></i>
            </div>
        </div>
        <h1 class="text-4xl md:text-5xl font-bold text-white mb-4">Welcome to IoTBay</h1>
        <p class="text-xl text-blue-100 max-w-2xl mx-auto">Sydney's premier online destination for Internet-of-Things devices</p>
        <div class="mt-6 space-x-4">

            <a href="updateUser.jsp">Update Profile</a>
            <form action="LogoutServlet" method="post" class="inline">
                <button type="submit" class="bg-white text-blue-600 font-semibold py-2 px-4 rounded-lg hover:bg-gray-100 transition">
                    Logout
                </button>
            </form>
            <form action="DeleteServlet" method="post" class="inline" onsubmit="return confirmDeleteAccount();">
                <button type="submit" class="bg-red-600 text-white font-semibold py-2 px-4 rounded-lg hover:bg-red-700 transition">
                    Delete Account
                </button>
            </form>
        </div>
    </header>

    <!-- Project Overview -->
    <section class="bg-white rounded-2xl shadow-xl p-8 mb-12">
        <div class="flex flex-col md:flex-row items-center">
            <div class="md:w-1/2 mb-8 md:mb-0 md:pr-8">
                <h2 class="text-3xl font-bold mb-4 text-gray-800">IoT Devices Ordering Application</h2>
                <p class="text-gray-600 mb-6">IoTBay is transforming from a Sydney-based brick-and-mortar retailer to a comprehensive online platform specializing in IoT devices including sensors, actuators, gateways, and more.</p>

                <div class="mb-6 p-4 bg-blue-50 rounded-lg border-l-4 border-blue-500">
                    <h4 class="font-semibold text-blue-800 mb-2">Project Phases:</h4>
                    <ul class="list-disc list-inside text-blue-700">
                        <li><strong>Release 0 (R0):</strong> Basic authentication system (login/register/logout)</li>
                        <li><strong>Release 1 (R1):</strong> Full e-commerce functionality with inventory management</li>
                    </ul>
                </div>

                <button class="bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-6 rounded-lg transition duration-200 transform hover:scale-105">
                    Explore IoT Devices
                </button>
            </div>
            <div class="md:w-1/2">
            </div>
        </div>
    </section>

    <!-- Key Features -->
    <section class="mb-16">
        <h2 class="text-3xl font-bold text-center text-white mb-12">System Capabilities</h2>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <!-- Feature 1 -->
            <div class="bg-white rounded-xl p-8 card-hover">
                <div class="feature-icon">
                    <i class="fas fa-user-shield text-2xl text-blue-600"></i>
                </div>
                <h3 class="text-xl font-semibold text-center mb-3">Secure Authentication</h3>
                <p class="text-gray-600 text-center">Role-based access control with customer and staff portals, secure registration and login workflows.</p>
            </div>

            <!-- Feature 2 -->
            <div class="bg-white rounded-xl p-8 card-hover">
                <div class="feature-icon">
                    <i class="fas fa-shopping-cart text-2xl text-blue-600"></i>
                </div>
                <h3 class="text-xl font-semibold text-center mb-3">E-Commerce Platform</h3>
                <p class="text-gray-600 text-center">Complete online store for browsing IoT devices, adding to cart, and secure checkout process.</p>
            </div>

            <!-- Feature 3 -->
            <div class="bg-white rounded-xl p-8 card-hover">
                <div class="feature-icon">
                    <i class="fas fa-boxes text-2xl text-blue-600"></i>
                </div>
                <h3 class="text-xl font-semibold text-center mb-3">Inventory Management</h3>
                <p class="text-gray-600 text-ce nter">Comprehensive tools for staff to manage product inventory, stock levels, and device categories.</p>
            </div>
        </div>
    </section>
</div>
</body>
</html>