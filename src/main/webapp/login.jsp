<%-- 
    Document   : login
    Created on : May 31, 2025, 8:01:09 PM
    Author     : manht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                display: flex;
                flex-direction: column; /* Changed to column to stack elements vertically */
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }

            form {
                background-color: #fff;
                padding: 30px 40px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                width: 400px;
            }

            table {
                width: 100%;
                border-spacing: 0;
            }

            td {
                padding: 10px 5px;
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 8px 10px;
                font-size: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
            }

            label {
                font-weight: bold;
            }

            .button-container {
                margin-top: 15px;
                display: flex;
                gap: 10px;
            }

            input[type="submit"],
            .register-button {
                padding: 10px 20px;
                font-size: 16px;
                color: #fff;
                background-color: #3498db;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                flex: 1;
                text-align: center;
                text-decoration: none;
                box-sizing: border-box;
            }

            input[type="submit"]:hover,
            .register-button:hover {
                background-color: #2980b9;
            }

            .login-title { /* Added a class for the login title */
                text-align: center;
                font-size: 18px;
                margin-bottom: 20px;
                color: #333;
            }
        </style>
    </head>
    <body>
        <p class="login-title">Login side</p> <form action="auth" method="POST">
            <table>
                <tbody>
                    <tr>
                        <td>Email :</td>
                        <td><input type="text" name="email" /></td>
                    </tr>
                    <tr>
                        <td>Password :</td>
                        <td><input type="password" name="password" /></td>
                    </tr>
                </tbody>
            </table>
            <div class="button-container">
                <input type="submit" name="type" value="LOGIN" />
                <a href="register.html" class="register-button">Register</a>
            </div>
        </form>
    </body>
</html>