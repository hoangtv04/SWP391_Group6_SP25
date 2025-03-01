<%-- 
    Document   : HomePage
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
        <title>Home Page - Beta Cinemas</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            .container {
                width: 80%;
                margin: auto;
                overflow: hidden;
            }
            #main-header {
                background-color: #333;
                color: #fff;
                padding-top: 30px;
                min-height: 70px;
                border-bottom: #77aaff 3px solid;
            }
            #main-header h1 {
                text-align: center;
                text-transform: uppercase;
                margin: 0;
                font-size: 24px;
            }
            .movie-list {
                background: #fff;
                padding: 20px;
                margin: 20px 0;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .movie-item {
                border-bottom: 1px solid #ddd;
                padding: 10px 0;
            }
            .movie-item:last-child {
                border-bottom: none;
            }
            .movie-item h2 {
                margin: 0;
                font-size: 20px;
            }
            .movie-item p {
                margin: 5px 0;
            }
            .movie-item a {
                display: inline-block;
                margin-top: 10px;
                padding: 10px 15px;
                background: #333;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
            }
            .movie-item a:hover {
                background: #555;
            }
        </style>
    </head>
    <body>
        <header id="main-header">
            <div class="container">
                <h1>Beta Cinemas</h1>
            </div>
        </header>
        <div class="container">
            <div class="movie-list">
                <h2>Now Showing</h2>
                <%
                    List<Movie> movies = (List<Movie>) request.getAttribute("movies");
                    if (movies != null && !movies.isEmpty()) {
                        for (Movie movie : movies) {
                %>
                    <div class="movie-item">
                        <h2><%= movie.getTitle() %></h2>
                        <p><strong>Genre:</strong> <%= movie.getGenre() %></p>
                        <p><strong>Duration:</strong> <%= movie.getDuration() %> minutes</p>
                        <p><strong>Release Date:</strong> <%= movie.getReleaseDate() %></p>
                        <p><strong>Description:</strong> <%= movie.getDescription() %></p>
                        <a href="MovieHome.jsp?movieId=<%= movie.getMovieID() %>">View Details</a>
                    </div>
                <%
                        }
                    } else {
                %>
                    <p>No movies available.</p>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
