<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Login Page</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap');
    * {
      box-sizing: border-box;
    }
    body {
      margin: 0;
      /*background-color: #cfcfcf;*/
      font-family: 'Inter', sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      padding: 1rem;
    }
    .container {
      background-color: white;
      border-radius: 1.75rem;
      max-width: 900px;
      width: 100%;
      display: flex;
      box-shadow: 0 6px 15px rgb(0 0 0 / 0.1);
      overflow: hidden;
      min-height: 480px;
    }
    .image-side {
      width: 45%;
      background-color: #f8f8f8;
      position: relative;
    }
    .image-side img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      display: block;
    }
    .image-side .frame {
      position: absolute;
      top: 1rem;
      left: 1rem;
      right: 1rem;
      bottom: 1rem;
      pointer-events: none;
      /* subtle shadow or border to define inside edge */
      border-radius: 0.75rem;
    }
    .form-side {
      width: 55%;
      padding: 3rem 3.5rem;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }
    .logo {
      font-weight: 700;
      font-size: 1.4rem;
      display: flex;
      align-items: center;
      gap: 0.6rem;
      margin-bottom: 2rem;
      color: #000;
    }
    .logo svg {
      width: 28px;
      height: 28px;
      fill: #e44d26;
    }
    h2 {
      font-weight: 600;
      margin: 0 0 1.8rem 0;
      font-size: 1.15rem;
      color: #111;
    }
    form {
      display: flex;
      flex-direction: column;
      gap: 1.2rem;
    }
    input[type="text"],
    input[type="password"],
    input[type="submit"]
    {
      border: 1px solid #d0d7de;
      border-radius: 0.3rem;
      padding: 0.6rem 0.8rem;
      font-size: 0.9rem;
      color: #202020;
      outline-offset: 2px;
      transition: border-color 0.2s ease-in-out;
    }
    input[type="text"]::placeholder,
    input[type="password"]::placeholder {
      color: #a6a6a6;
      font-weight: 400;
    }
    input[type="text"]:focus,
    input[type="password"]:focus {
      border-color: #444;
    }
    input[type="submit"] {
      margin-top: 0.6rem;
      background-color: #000;
      color: white;
      font-weight: 600;
      padding: 0.85rem;
      border: none;
      border-radius: 0.4rem;
      font-size: 1rem;
      cursor: pointer;
      user-select: none;
      letter-spacing: 0.03em;
      transition: background-color 0.3s ease;
    }
    input[type="submit"]:hover,
    input[type="submit"]:focus {
      background-color: #222;
      outline: none;
    }
    .message {
      margin-top: 1rem;
      padding: 0.75rem;
      border-radius: 0.4rem;
      font-size: 0.9rem;
      font-weight: 500;
      background-color: #f8f9fa;
      border-left: 4px solid #007bff;
      color: #495057;
    }
    .links {
      margin-top: 1rem;
      font-size: 0.85rem;
      color: #505050;
      user-select: none;
    }
    .links a {
      color: #2e3a8c;
      text-decoration: none;
      font-weight: 500;
      cursor: pointer;
    }
    .links a:hover,
    .links a:focus {
      text-decoration: underline;
      outline: none;
    }
    /* Responsive */
    @media (max-width: 720px) {
      .container {
        flex-direction: column;
        border-radius: 1rem;
        max-width: 400px;
        min-height: auto;
      }
      .image-side {
        width: 100%;
        height: 180px;
        border-radius: 1rem 1rem 0 0;
      }
      .form-side {
        width: 100%;
        padding: 2rem 2.5rem 3rem 2.5rem;
      }
    }
  </style>
</head>
<body>
    <main class="container" role="main" aria-label="Register form">
                <section class="image-side" aria-hidden="true">
                    <img 
                        src="https://png.pngtree.com/background/20230519/original/pngtree-the-interior-of-a-clothing-store-with-clothing-on-display-picture-image_2654940.jpg" 
                        alt="Young woman with curly hair sitting in rattan chair, reading a tablet in a bright, minimalist room with neutral colors." 
                        onerror="this.style.display='none'"
                        />
                </section>

                <section class="form-side" aria-label="Account sign in">
                    <div class="logo" aria-label="Company logo">
                        Register side
                    </div>
                    <form action="auth" method="post">
                        <input type="text" name="userName" placeholder="UserName" aria-label="Email address" required />
                        <input type="text" name="firstName" placeholder="First Name" aria-label="Email address" required />
                        <input type="text" name="lastName" placeholder="Last Name" aria-label="Email address" required />
                        <input type="text" name="email" placeholder="Email" aria-label="Email address" required />
                        <input type="text" name="phone" placeholder="Phone" aria-label="Email address" required />
                        <input type="text" name="address" placeholder="Address" aria-label="Email address" required />
                        <input type="password" name="password" placeholder="Password" aria-label="Email address" required />
                        <input type="password" name="confirmPassword" placeholder="Confirm Password" aria-label="Password" required />
                        <input type="submit" name="type" value="REGISTER">
                    </form>
                    
                    <!-- Error/Success Messages -->
                    <c:if test="${not empty requestScope.msg}">
                        <div class="message">
                            ${requestScope.msg}
                        </div>
                    </c:if>
                    
                    <div class="links">
                        Already have an account? <a href="login.jsp">Sign in here</a>
                    </div>
                </section>
            </main>
</body>
</html>
