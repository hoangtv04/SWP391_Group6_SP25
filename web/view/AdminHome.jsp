<%-- 
    Document   : AdminHome
    Created on : Mar 1, 2025, 11:23:49 PM
    Author     : tovie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .container {
                width: 80%;
                margin: 0 auto;
            }
            .header, .footer {
                background-color: #f1f1f1;
                padding: 20px;
                text-align: center;
            }
            .nav {
                margin: 20px 0;
                text-align: center;
            }
            .nav a {
                margin: 0 15px;
                text-decoration: none;
                color: #333;
            }
            .nav a:hover {
                text-decoration: underline;
            }
            .content {
                margin: 20px 0;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>Admin Dashboard</h1>
                <p>Welcome, Admin!</p>
            </div>
            <div class="nav">
                <a href="#movies">Manage Movies</a>
                <a href="#showtimes">Manage Showtimes</a>
                <a href="#bookings">Manage Bookings</a>
                <a href="#customers">Manage Customers</a>
            </div>
            <div class="content">
                <section id="movies">
                    <h2>Manage Movies</h2>
                    <table>
                        <tr>
                            <th>Movie ID</th>
                            <th>Title</th>
                            <th>Genre</th>
                            <th>Duration</th>
                            <th>Release Date</th>
                            <th>Description</th>
                            <th>Actions</th>
                        </tr>
                        <!-- Movie data will be populated here -->
                    </table>
                </section>
                <section id="showtimes">
                    <h2>Manage Showtimes</h2>
                    <table>
                        <tr>
                            <th>Showtime ID</th>
                            <th>Movie ID</th>
                            <th>Cinema ID</th>
                            <th>Showtime</th>
                            <th>Actions</th>
                        </tr>
                        <!-- Showtime data will be populated here -->
                    </table>
                </section>
                <section id="bookings">
                    <h2>Manage Bookings</h2>
                    <table>
                        <tr>
                            <th>Booking ID</th>
                            <th>Customer ID</th>
                            <th>Showtime ID</th>
                            <th>Booking Date</th>
                            <th>Actions</th>
                        </tr>
                        <!-- Booking data will be populated here -->
                    </table>
                </section>
                <section id="customers">
                    <h2>Manage Customers</h2>
                    <table>
                        <tr>
                            <th>Customer ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Actions</th>
                        </tr>
                        <!-- Customer data will be populated here -->
                    </table>
                </section>
            </div>
            <div class="footer">
                <p>&copy; 2025 Movie Ticket Booking System</p>
            </div>
        </div>
    </body>
</html>
