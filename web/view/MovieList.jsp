<%-- 
    Document   : MovieList
    Created on : Mar 1, 2025, 11:31:03 PM
    Author     : tovie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Movie"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie List</title>
        <style>
            .movie-poster {
                width: 200px;
                height: 300px;
                margin: 10px;
                display: inline-block;
                text-align: center;
            }
            .movie-poster img {
                width: 100%;
                height: auto;
            }
        </style>
    </head>
    <body>
        <h1>Movie List</h1>
        <div class="movie-list">
            <%
                List<Movie> movies = (List<Movie>) request.getAttribute("movies");
                if (movies != null) {
                    for (Movie movie : movies) {
            %>
                        <div class="movie-poster">
                            <a href="movie?id=<%= movie.getMovieId() %>">
                                <img src="path/to/posters/<%= movie.getMovieId() %>.jpg" alt="<%= movie.getTitle() %>">
                                <p><strong><%= movie.getTitle() %></strong></p>
                            </a>
                        </div>
            <%
                    }
                } else {
            %>
                    <p>No movies found.</p>
            <%
                }
            %>
        </div>
    </body>
</html>