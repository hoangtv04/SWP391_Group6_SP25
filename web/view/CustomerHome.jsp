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
            .movie-item .card {
                border: 2px solid #007bff; /* Add border to the entire card */
                border-radius: 5px;
                transition: transform 0.3s ease, box-shadow 0.3s ease; /* Add transition for hover effect */
            }
            .movie-item .card:hover {
                transform: scale(1.05); /* Scale up the card on hover */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Add shadow on hover */
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
                border-radius: 5px 5px 0 0; /* Adjust border radius for the top corners */
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
            .banner {
                width: 100%;
                height: 300px;
                margin-bottom: 20px;
                border-radius: 5px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #fff;
                font-size: 24px;
                font-weight: bold;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
                position: relative;
                overflow: hidden;
            }
            .banner img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                position: absolute;
                top: 0;
                left: 0;
                transition: opacity 1s ease-in-out;
            }
            .banner img.active {
                opacity: 1;
            }
            .banner img.inactive {
                opacity: 0;
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
            <div class="banner">
                <img src="images banner/banner1.jpg" class="active" alt="Banner 1">
                <img src="images banner/banner2.jpg" class="inactive" alt="Banner 2">
                <img src="images banner/banner3.jpg" class="inactive" alt="Banner 3">
                <img src="images banner/banner4.jpg" class="inactive" alt="Banner 4">
                <img src="images banner/banner5.jpg" class="inactive" alt="Banner 5">
            </div>
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
        <script>
            // JavaScript to rotate the banner images
            let currentIndex = 0;
            const banners = document.querySelectorAll('.banner img');
            setInterval(() => {
                banners[currentIndex].classList.remove('active');
                banners[currentIndex].classList.add('inactive');
                currentIndex = (currentIndex + 1) % banners.length;
                banners[currentIndex].classList.remove('inactive');
                banners[currentIndex].classList.add('active');
            }, 3000); // Change image every 3 seconds
        </script>
    </body>
</html>

