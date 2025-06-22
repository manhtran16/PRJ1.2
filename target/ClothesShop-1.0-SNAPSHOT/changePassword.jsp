<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Change Password</title>
    <link href="css/mdb.min.css" rel="stylesheet" />
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
    <div class="container">
      <div class="change-password-container">
        <h2 class="text-center mb-4">Đổi mật khẩu</h2>

        <!-- Display error message -->
        <c:if test="${not empty errorMessage}">
          <div class="alert alert-danger">${errorMessage}</div>
        </c:if>

        <!-- Display success message -->
        <c:if test="${not empty successMessage}">
          <div class="alert alert-success">${successMessage}</div>
        </c:if>

        <form method="post" action="changePassword">
          <!-- Current Password -->
          <div class="form-outline mb-3">
            <input
              type="password"
              id="currentPassword"
              name="currentPassword"
              class="form-control"
              required
            />
            <label class="form-label" for="currentPassword"
              >Current Password</label
            >
          </div>

          <!-- New Password -->
          <div class="form-outline mb-3">
            <input
              type="password"
              id="newPassword"
              name="newPassword"
              class="form-control"
              required
            />
            <label class="form-label" for="newPassword">New Password</label>
          </div>

          <!-- Confirm New Password -->
          <div class="form-outline mb-4">
            <input
              type="password"
              id="confirmPassword"
              name="confirmPassword"
              class="form-control"
              required
            />
            <label class="form-label" for="confirmPassword"
              >Confirm New Password</label
            >
          </div>

          <!-- Submit Button -->
          <div class="text-center">
            <button type="submit" class="btn btn-primary btn-block">
              Change Password
            </button>
          </div>

          <!-- Back to Profile Link -->
          <div class="text-center mt-3">
            <a href="userhome.jsp" class="btn btn-outline-secondary"
              >Back to Profile</a
            >
          </div>
        </form>
      </div>
    </div>

    <!-- MDB JavaScript -->
    <script src="js/mdb.umd.min.js"></script>
    <script>
      // Initialize MDB form elements
      document.addEventListener("DOMContentLoaded", function () {
        // Initialize form inputs
        const inputs = document.querySelectorAll(".form-outline input");
        inputs.forEach((input) => {
          new mdb.Input(input);
        });
      });

      // Client-side password validation
      document.querySelector("form").addEventListener("submit", function (e) {
        const newPassword = document.getElementById("newPassword").value;
        const confirmPassword =
          document.getElementById("confirmPassword").value;

        if (newPassword !== confirmPassword) {
          e.preventDefault();
          alert("New password and confirmation do not match!");
          return false;
        }

        if (newPassword.length < 6) {
          e.preventDefault();
          alert("New password must be at least 6 characters long!");
          return false;
        }
      });
    </script>
  </body>
</html>
