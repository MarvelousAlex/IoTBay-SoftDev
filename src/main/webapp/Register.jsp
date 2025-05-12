<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import= "Model.dao.*"%>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | Web App</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .input-focus-effect:focus {
            box-shadow: 0 0 0 3px rgba(118, 75, 162, 0.3);
        }
        .password-toggle {
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }
        .error-message {
            color: #ef4444;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }
        .success-message {
            color: #10b981;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center gradient-bg p-4">
<div class="w-full max-w-md">
    <div class="bg-white rounded-2xl shadow-xl overflow-hidden">
        <div class="p-8">
            <div class="text-center mb-8">
                <h1 class="text-3xl font-bold text-gray-800">Create Account</h1>
                <p class="text-gray-600 mt-2">Join our community today</p>
            </div>

            <form id="registerForm" method="post" action="RegisterServlet" class="space-y-6">
                <div id="formSuccess" class="hidden success-message text-center"></div>
                <div>
                    <label for="name" class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fas fa-user text-gray-400"></i>
                        </div>
                        <input type="text" id="name" name="name"
                               class="pl-10 w-full px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:border-purple-500 input-focus-effect transition duration-200"
                               placeholder="Hoshimi Miyabi">
                    </div>
                    <div id="nameError" class="error-message hidden"></div>
                </div>

                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fas fa-envelope text-gray-400"></i>
                        </div>
                        <input type="email" id="email" name="email" onblur="validateEmailField()"
                               class="pl-10 w-full px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:border-purple-500 input-focus-effect transition duration-200"
                               placeholder="Hoshimi@HAND.zzz.com">
                    </div>
                    <div id="emailError" class="error-message hidden"></div>
                </div>

                <div>
                    <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fas fa-lock text-gray-400"></i>
                        </div>
                        <input type="password" id="password" name="password"
                               class="pl-10 w-full px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:border-purple-500 input-focus-effect transition duration-200"
                               placeholder="••••••••">
                        <div class="absolute password-toggle" id="togglePassword">
                            <i class="fas fa-eye text-gray-400"></i>
                        </div>
                    </div>
                    <div id="passwordError" class="error-message hidden"></div>
                    <div class="mt-2 text-xs text-gray-500">
                        <p>Password must be at least 8 characters</p>
                    </div>
                </div>

                <div class="flex items-center">
                    <input type="checkbox" id="terms" name="tos" class="h-4 w-4 text-purple-600 focus:ring-purple-500 border-gray-300 rounded">
                    <label for="terms" class="ml-2 block text-sm text-gray-700">
                        I agree to the <a href="#" class="text-purple-600 hover:text-purple-500">Terms of Service</a> and <a href="#" class="text-purple-600 hover:text-purple-500">Privacy Policy</a>
                    </label>
                </div>
                <div id="termsError" class="error-message hidden">You must agree to the terms</div>

                <button type="submit" class="w-full bg-purple-600 hover:bg-purple-700 text-white font-semibold py-3 px-4 rounded-lg transition duration-200 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-opacity-50">
                    Create Account
                </button>
            </form>

            <div class="mt-6 text-center">
                <p class="text-sm text-gray-600">
                    Already have an account? <a href="login.jsp" class="text-purple-600 font-medium hover:text-purple-500">Login your account</a>
                </p>
            </div>
        </div>

        <div class="bg-gray-50 px-8 py-6">
            <div class="text-center">
                <p class="text-xs text-gray-500">
                    By continuing, you agree to our <a href="#" class="text-purple-600 hover:text-purple-500">User Agreement</a> and acknowledge that you've read our <a href="#" class="text-purple-600 hover:text-purple-500">Privacy Policy</a>.
                </p>
            </div>
        </div>
    </div>
</div>
</body>
</html>