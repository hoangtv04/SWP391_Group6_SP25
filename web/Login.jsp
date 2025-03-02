<%-- 
    Document   : Login
    Created on : Mar 2, 2025, 9:48:00 PM
    Author     : tovie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .login-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 300px;
                text-align: center;
            }
            .login-container h1 {
                margin-bottom: 20px;
            }
            .login-container input[type="text"],
            .login-container input[type="password"] {
                width: calc(100% - 22px); /* Adjust width to fit within the container */
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box; /* Ensure padding and border are included in the width */
            }
            .login-container input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #39c7eb;
                border: none;
                border-radius: 4px;
                color: white;
                font-size: 16px;
                cursor: pointer;
            }
            .login-container input[type="submit"]:hover {
                background-color: #39c7eb;
            }
            .login-container a {
                display: block;
                margin-top: 10px;
                color: #131414;
                text-decoration: none;
            }
            .login-container a:hover {
                text-decoration: underline;
            }
            .message {
                margin-bottom: 20px;
                color: red;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h1>Login</h1>
            <form action="login" method="post">
                <input type="text" name="username" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="submit" value="Login">
            </form>
            <a href="forgot-password.jsp">Forgot Password?</a>
            <%
                String message = (String) request.getAttribute("message");
                if (message != null) {
            %>
                <p class="message"><%= message %></p>
            <%
                }
            %>
        </div>
    </body>
</html>
