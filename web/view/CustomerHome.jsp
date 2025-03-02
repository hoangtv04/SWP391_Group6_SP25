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
            .movie-item img {
                width: 100%;
                height: 500px; /* Tăng chiều cao của ảnh */
                object-fit: cover; /* Đảm bảo ảnh được cắt đúng cách */
                border-radius: 5px;
                border: 2px solid #007bff; /* Thêm viền */
                transition: transform 0.3s ease; /* Hiệu ứng động */
            }
            .movie-item img:hover {
                transform: scale(1.05); /* Phóng to ảnh khi trỏ vào */
            }
        </style>
    </head>
    <body>
        <header class="bg-dark text-white text-center py-3">
            <div class="container">
                <h1>Show Movies</h1>
            </div>
        </header>

        <!-- Banner Section -->
        <div id="bannerCarousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="images/banner/banner1.jpg" class="d-block w-100" alt="Banner 1">
                </div>
                <div class="carousel-item">
                    <img src="images/banner/banner2.jpg" class="d-block w-100" alt="Banner 2">
                </div>
                <div class="carousel-item">
                    <img src="images/banner/banner3.jpg" class="d-block w-100" alt="Banner 3">
                </div>
                <div class="carousel-item">
                    <img src="images/banner/banner4.jpg" class="d-block w-100" alt="Banner 4">
                </div>
                <div class="carousel-item">
                    <img src="images/banner/banner5.jpg" class="d-block w-100" alt="Banner 5">
                </div>
            </div>
            <a class="carousel-control-prev" href="#bannerCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#bannerCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

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

