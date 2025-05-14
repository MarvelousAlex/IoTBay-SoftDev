<%--
  Created by IntelliJ IDEA.
  User: zhouwende
  Date: 14/5/2025
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Profile Update Form</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
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

    <!-- Form -->
    <form id="profileForm" class="p-6 space-y-6">
      <!-- Name Field -->
      <div class="space-y-2">
        <label for="name" class="block text-sm font-medium text-gray-700">Full Name</label>
        <div class="relative">
          <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
            <i class="fas fa-user text-gray-400"></i>
          </div>
          <input
                  type="text"
                  id="name"
                  name="name"
                  class="input-highlight pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 py-2 px-3 border"
                  placeholder="John Doe"
                  required
          >
        </div>
        <p id="nameError" class="text-red-500 text-xs italic hidden">Please enter a valid name</p>
      </div>

      <!-- Email Field -->
      <div class="space-y-2">
        <label for="email" class="block text-sm font-medium text-gray-700">Email Address</label>
        <div class="relative">
          <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
            <i class="fas fa-envelope text-gray-400"></i>
          </div>
          <input
                  type="email"
                  id="email"
                  name="email"
                  class="input-highlight pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 py-2 px-3 border"
                  placeholder="john@example.com"
                  required
          >
        </div>
        <p id="emailError" class="text-red-500 text-xs italic hidden">Please enter a valid email address</p>
      </div>

      <!-- Current Password -->
      <div class="space-y-2">
        <label for="currentPassword" class="block text-sm font-medium text-gray-700">Current Password</label>
        <div class="relative">
          <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
            <i class="fas fa-lock text-gray-400"></i>
          </div>
          <input
                  type="password"
                  id="currentPassword"
                  name="currentPassword"
                  class="input-highlight pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 py-2 px-3 border"
                  placeholder="••••••••"
                  required
          >
          <div class="absolute inset-y-0 right-0 pr-3 flex items-center">
            <i id="toggleCurrentPassword" class="password-toggle fas fa-eye-slash text-gray-400"></i>
          </div>
        </div>
        <p id="currentPasswordError" class="text-red-500 text-xs italic hidden">Current password is required</p>
      </div>

      <!-- New Password -->
      <div class="space-y-2">
        <label for="newPassword" class="block text-sm font-medium text-gray-700">New Password (optional)</label>
        <div class="relative">
          <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
            <i class="fas fa-key text-gray-400"></i>
          </div>
          <input
                  type="password"
                  id="newPassword"
                  name="newPassword"
                  class="input-highlight pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 py-2 px-3 border"
                  placeholder="••••••••"
          >
          <div class="absolute inset-y-0 right-0 pr-3 flex items-center">
            <i id="toggleNewPassword" class="password-toggle fas fa-eye-slash text-gray-400"></i>
          </div>
        </div>
        <div id="passwordStrength" class="hidden mt-2">
          <div class="flex space-x-2">
            <div class="h-1 w-1/4 bg-gray-200 rounded-full" id="strength1"></div>
            <div class="h-1 w-1/4 bg-gray-200 rounded-full" id="strength2"></div>
            <div class="h-1 w-1/4 bg-gray-200 rounded-full" id="strength3"></div>
            <div class="h-1 w-1/4 bg-gray-200 rounded-full" id="strength4"></div>
          </div>
          <p id="passwordHint" class="text-xs mt-1 text-gray-500"></p>
        </div>
        <p id="passwordError" class="text-red-500 text-xs italic hidden">Password must be at least 8 characters</p>
      </div>

      <!-- Confirm New Password -->
      <div class="space-y-2">
        <label for="confirmPassword" class="block text-sm font-medium text-gray-700">Confirm New Password</label>
        <div class="relative">
          <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
            <i class="fas fa-key text-gray-400"></i>
          </div>
          <input
                  type="password"
                  id="confirmPassword"
                  name="confirmPassword"
                  class="input-highlight pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 py-2 px-3 border"
                  placeholder="••••••••"
                  disabled
          >
          <div class="absolute inset-y-0 right-0 pr-3 flex items-center">
            <i id="toggleConfirmPassword" class="password-toggle fas fa-eye-slash text-gray-400"></i>
          </div>
        </div>
        <p id="confirmPasswordError" class="text-red-500 text-xs italic hidden">Passwords don't match</p>
      </div>

      <!-- Form Actions -->
      <div class="flex items-center justify-between pt-4">
        <button
                type="button"
                class="px-4 py-2 border border-gray-300 rounded-md text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-all"
                id="cancelBtn"
        >
          Cancel
        </button>
        <button
                type="submit"
                class="px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-all flex items-center"
                id="submitBtn"
        >
          <span id="submitText">Update Profile</span>
          <i id="submitSpinner" class="fas fa-spinner fa-spin ml-2 hidden"></i>
        </button>
      </div>
    </form>
  </div>

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
