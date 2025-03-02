<%-- 
    Document   : CustomerHome
    Created on : Mar 1, 2025, 11:18:29 PM
    Author     : tovie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Movie"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Movies</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            .container {
                margin-top: 20px;
            }
            .movie-item {
                margin-bottom: 20px;
            }
            .movie-item h2 {
                font-size: 20px;
                font-weight: bold; /* Make movie title bold */
                color: #000; /* Set movie title color to black */
            }
            .movie-item h2:hover {
                text-decoration: underline; /* Underline on hover */
            }
            .movie-item p {
                margin: 5px 0;
                font-size: 16px; /* Adjust font size */
                color: #555; /* Adjust text color */
            }
            .movie-item a {
                display: inline-block;
                margin-top: 10px;
                padding: 10px 15px;
                background: #007bff;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                transition: background 0.3s ease;
            }
            .movie-item a:hover {
                background: #0056b3;
            }
            .movie-item img {
                width: 100%;
                height: 500px; 
                object-fit: cover; 
                border-radius: 5px;
                border: 2px solid #007bff; 
                transition: transform 0.3s ease;
            }
            .movie-item img:hover {
                transform: scale(1.05); 
            }
            .movie-item .card-title {
                color: #000; /* Set movie title color to black */
                text-decoration: none;
                transition: color 0.3s ease;
            }
            .movie-item .card-title:hover {
                text-decoration: underline; /* Underline on hover */
            }
            .movie-item .card-text {
                font-weight: bold; /* Make release date text bold */
            }
        </style>
    </head>
    <body>
        <header class="bg-dark text-white text-center py-3">
            <div class="container">
                <h1>Show Movies</h1>
            </div>
        </header>
        <div class="container">
            <%
                List<Movie> movies = (List<Movie>) request.getAttribute("movies");
                if (movies != null && !movies.isEmpty()) {
                    int index = 1;
                    for (int i = 0; i < movies.size(); i++) {
                        if (i % 3 == 0) {
            %>
            <div class="row">
            <%
                        }
            %>
                <div class="col-md-4 movie-item">
                    <div class="card h-100 d-flex flex-column">
                        <img src="images poster/phim<%= index %>.jpg" class="card-img-top" alt="<%= movies.get(i).getTitle() %>">
                        <div class="card-body d-flex flex-column">
                            <h2 class="card-title text-center"><%= movies.get(i).getTitle() %></h2>
                            <p class="card-text text-center"><strong>Release Date:</strong> <%= movies.get(i).getReleaseDate() %></p>
                        </div>
                    </div>
                </div>
            <%
                        index++;
                        if ((i + 1) % 3 == 0 || i == movies.size() - 1) {
            %>
            </div>
            <%
                        }
                    }
                } else {
            %>
            <div class="row">
                <p class="col-12">No movies available.</p>
            </div>
            <%
                }
            %>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>

