<%-- 
    Document   : ShowMovie
    Created on : Mar 2, 2025, 2:34:55 AM
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
            }
            .movie-item p {
                margin: 5px 0;
            }
            .movie-item a {
                display: inline-block;
                margin-top: 10px;
                padding: 10px 15px;
                background: #007bff;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
            }
            .movie-item a:hover {
                background: #0056b3;
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
            <div class="row">
                <%
                    List<Movie> movies = (List<Movie>) request.getAttribute("movies");
                    if (movies != null && !movies.isEmpty()) {
                        for (Movie movie : movies) {
                %>
                    <div class="col-md-6 movie-item">
                        <div class="card">
                            <div class="card-body">
                                <h2 class="card-title"><%= movie.getTitle() %></h2>
                                <p class="card-text"><strong>Genre:</strong> <%= movie.getGenre() %></p>
                                <p class="card-text"><strong>Duration:</strong> <%= movie.getDuration() %> minutes</p>
                                <p class="card-text"><strong>Release Date:</strong> <%= movie.getReleaseDate() %></p>
                                <p class="card-text"><strong>Description:</strong> <%= movie.getDescription() %></p>
                                <a href="MovieHome.jsp?movieId=<%= movie.getMovieID() %>" class="btn btn-primary">View Details</a>
                            </div>
                        </div>
                    </div>
                <%
                        }
                    } else {
                %>
                    <p class="col-12">No movies available.</p>
                <%
                    }
                %>
            </div>
        </div>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
