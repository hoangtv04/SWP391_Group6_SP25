<%-- 
    Document   : HomePageMovie
    Created on : Mar 1, 2025, 11:31:03 PM
    Author     : tovie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Details</title>
    </head>
    <body>
        <h1>Movie Details</h1>
        <%
            Movie movie = (Movie) request.getAttribute("movie");
            if (movie != null) {
        %>
            <p><strong>Title:</strong> <%= movie.getTitle() %></p>
            <p><strong>Genre:</strong> <%= movie.getGenre() %></p>
            <p><strong>Duration:</strong> <%= movie.getDuration() %> minutes</p>
            <p><strong>Release Date:</strong> <%= movie.getReleaseDate() %></p>
            <p><strong>Description:</strong> <%= movie.getDescription() %></p>
        <%
            } else {
        %>
            <p>No movie found with ID 1.</p>
        <%
            }
        %>
    </body>
</html>
