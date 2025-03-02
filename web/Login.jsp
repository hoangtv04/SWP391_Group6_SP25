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
            }
            .login-container {
                background: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 400px; /* Increase the width */
                box-sizing: border-box; /* Ensure padding and border are included in the element's total width and height */
            }
            .login-container h1 {
                text-align: center;
                margin-bottom: 20px;
            }
            .login-container label {
                display: block;
                margin-bottom: 5px;
            }
            .login-container input[type="text"],
            .login-container input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-sizing: border-box; /* Ensure padding and border are included in the element's total width and height */
            }
            .login-container input[type="submit"] {
                width: 100%;
                padding: 10px;
                background: #007bff; /* Blue color */
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                box-sizing: border-box; /* Ensure padding and border are included in the element's total width and height */
            }
            .login-container input[type="submit"]:hover {
                background: #0056b3; /* Darker blue on hover */
            }
            .error-message {
                color: red;
                text-align: center;
            }
        </style>
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
    </body>
</html>
