<%-- 
    Document   : Movie
    Created on : Mar 2, 2025, 2:15:01 AM
    Author     : tovie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Movie</title>
    </head>
    <body>
        <header id="main-header">
            <div class="container">
                <h1>Add New Movie</h1>
            </div>
        </header>
        <div class="container">
            <div class="form-container">
                <form action="AddMovieServlet" method="post">
                    <label for="title">Title:</label>
                    <input type="text" id="title" name="title" required>
                    
                    <label for="genre">Genre:</label>
                    <input type="text" id="genre" name="genre" required>
                    
                    <label for="duration">Duration (minutes):</label>
                    <input type="number" id="duration" name="duration" required>
                    
                    <label for="releaseDate">Release Date:</label>
                    <input type="date" id="releaseDate" name="releaseDate" required>
                    
                    <label for="description">Description:</label>
                    <textarea id="description" name="description" rows="4" required></textarea>
                    
                    <input type="submit" value="Add Movie">
                </form>
            </div>
        </div>
    </body>
</html>
