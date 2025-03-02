<%-- 
    Document   : Login
    Created on : Mar 1, 2025, 11:11:46 PM
    Author     : tovie
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
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                position: relative;
            }
            .login-container, .register-container {
                background: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 400px;
                box-sizing: border-box;
            }
            .login-container {
                margin-right: 20px;
            }
            .login-container h1, .register-container h1 {
                text-align: center;
                margin-bottom: 20px;
            }
            .login-container label, .register-container label {
                display: block;
                margin-bottom: 5px;
            }
            .login-container input[type="text"],
            .login-container input[type="password"],
            .register-container input[type="text"],
            .register-container input[type="password"],
            .register-container input[type="email"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-sizing: border-box;
            }
            .login-container input[type="submit"],
            .register-container input[type="submit"] {
                width: 100%;
                padding: 10px;
                background: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                box-sizing: border-box;
            }
            .login-container input[type="submit"]:hover,
            .register-container input[type="submit"]:hover {
                background: #0056b3;
            }
            .error-message {
                color: red;
                text-align: center;
            }
            .register-container {
                position: absolute;
                top: 20px;
                right: 20px;
                width: 300px;
                display: none; /* Initially hidden */
            }
            .register-button {
                position: absolute;
                top: 20px;
                right: 20px;
                background: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                cursor: pointer;
            }
            .register-button:hover {
                background: #0056b3;
            }
        </style>
        <script>
            function toggleRegisterForm() {
                var registerContainer = document.querySelector('.register-container');
                if (registerContainer.style.display === 'none' || registerContainer.style.display === '') {
                    registerContainer.style.display = 'block';
                } else {
                    registerContainer.style.display = 'none';
                }
            }
        </script>
    </head>
    <body>
        <div class="login-container">
            <h1>Login</h1>
            <form action="login" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
                
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                
                <input type="submit" value="Login">
            </form>
            
            <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %>
                <p class="error-message"><%= errorMessage %></p>
            <%
                }
            %>
        </div>
        <button class="register-button" onclick="toggleRegisterForm()">Register</button>
        <div class="register-container">
            <h1>Register</h1>
            <form action="register" method="post">
                <label for="reg-username">Username:</label>
                <input type="text" id="reg-username" name="username" required>
                
                <label for="reg-password">Password:</label>
                <input type="password" id="reg-password" name="password" required>
                
                <label for="reg-email">Email:</label>
                <input type="email" id="reg-email" name="email" required>
                
                <input type="submit" value="Register">
            </form>
        </div>
    </body>
</html>
