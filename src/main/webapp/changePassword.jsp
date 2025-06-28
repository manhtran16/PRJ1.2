<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Change Password</title>
    <link href="css/mdb.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .change-password-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .alert {
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 20px;
        }
        .alert-danger {
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
        }
        .alert-success {
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #cc66ff;">
        <div class="container">
            <a class="navbar-brand text-white" href="index.jsp">
                <i class="fas fa-tshirt me-2"></i>Clothes Shop
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link text-white" href="index.jsp">
                    <i class="fas fa-home me-1"></i>Home
                </a>
                <a class="nav-link text-white" href="userOrders">
                    <i class="fas fa-receipt me-1"></i>My Orders
                </a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="change-password-container">
            <h2 class="text-center mb-4">
                <i class="fas fa-key me-2"></i>Change Password
            </h2>

            <!-- Display error message -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>

            <!-- Display success message -->
            <c:if test="${not empty success}">
                <div class="alert alert-success">${success}</div>
            </c:if>

            <form method="post" action="changepassword">
                <!-- Current Password -->
                <div class="form-outline mb-3">
                    <input type="password" id="currentPassword" name="currentPassword" class="form-control" required>
                    <label class="form-label" for="currentPassword">
                        <i class="fas fa-lock me-1"></i>Current Password
                    </label>
                </div>

                <!-- New Password -->
                <div class="form-outline mb-3">
                    <input type="password" id="newPassword" name="newPassword" class="form-control" required>
                    <label class="form-label" for="newPassword">
                        <i class="fas fa-key me-1"></i>New Password
                    </label>
                    
                    <!-- Password Strength Indicator -->
                    <div class="mt-2">
                        <div class="progress" style="height: 4px;">
                            <div id="strengthBar" class="progress-bar" style="width: 0%;"></div>
                        </div>
                        <small id="strengthText" class="text-muted">Enter a password</small>
                    </div>
                </div>

                <!-- Confirm New Password -->
                <div class="form-outline mb-4">
                    <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
                    <label class="form-label" for="confirmPassword">
                        <i class="fas fa-check-circle me-1"></i>Confirm New Password
                    </label>
                </div>

                <!-- Submit Button -->
                <div class="text-center">
                    <button type="submit" class="btn btn-primary btn-block">
                        <i class="fas fa-save me-1"></i>Change Password
                    </button>
                </div>

                <!-- Back to Profile Link -->
                <div class="text-center mt-3">
                    <a href="index.jsp" class="btn btn-outline-secondary">
                        <i class="fas fa-arrow-left me-1"></i>Back to Home
                    </a>
                </div>
            </form>
        </div>
    </div>

    <!-- MDB JavaScript -->
    <script src="js/mdb.umd.min.js"></script>
    <script>
        // Initialize MDB form elements
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize form inputs
            const inputs = document.querySelectorAll('.form-outline input');
            inputs.forEach(input => {
                new mdb.Input(input);
            });
        });

        // Client-side password validation
        document.querySelector('form').addEventListener('submit', function(e) {
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (newPassword !== confirmPassword) {
                e.preventDefault();
                alert('New password and confirmation do not match!');
                return false;
            }

            if (newPassword.length < 6) {
                e.preventDefault();
                alert('New password must be at least 6 characters long!');
                return false;
            }
        });

        // Password strength indicator
        document.getElementById('newPassword').addEventListener('input', function() {
            const password = this.value;
            const strengthBar = document.getElementById('strengthBar');
            const strengthText = document.getElementById('strengthText');

            if (!strengthBar) return; // If strength indicator doesn't exist, skip

            let strength = 0;
            let text = '';
            let color = '';

            if (password.length >= 6) strength++;
            if (password.length >= 8) strength++;
            if (/[A-Z]/.test(password)) strength++;
            if (/[0-9]/.test(password)) strength++;
            if (/[^A-Za-z0-9]/.test(password)) strength++;

            switch (strength) {
                case 0:
                case 1:
                    text = 'Too Weak';
                    color = '#dc3545';
                    break;
                case 2:
                    text = 'Weak';
                    color = '#fd7e14';
                    break;
                case 3:
                    text = 'Fair';
                    color = '#ffc107';
                    break;
                case 4:
                    text = 'Good';
                    color = '#20c997';
                    break;
                case 5:
                    text = 'Strong';
                    color = '#198754';
                    break;
            }

            if (strengthBar) {
                strengthBar.style.width = (strength * 20) + '%';
                strengthBar.style.backgroundColor = color;
            }
            if (strengthText) {
                strengthText.textContent = text;
                strengthText.style.color = color;
            }
        });
    </script>
</body>
</html>
