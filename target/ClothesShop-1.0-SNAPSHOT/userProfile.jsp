<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>User Profile</title>
    <link href="css/mdb.min.css" rel="stylesheet" />
  </head>
  <body>
    <div class="container mt-5">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="card">
            <div class="card-body">
              <h3 class="card-title text-center">User Profile</h3>
              <div class="text-center">
                <p>Welcome, <strong>${sessionScope.user.userName}</strong></p>
                <hr />
                <div class="d-grid gap-2">
                  <a href="changePassword.jsp" class="btn btn-primary"
                    >Đổi mật khẩu</a
                  >
                  <a href="userhome.jsp" class="btn btn-secondary"
                    >Back to Home</a
                  >
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script src="js/mdb.umd.min.js"></script>
  </body>
</html>
