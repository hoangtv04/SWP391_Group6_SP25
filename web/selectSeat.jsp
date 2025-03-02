<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Seat" %>

<%
    // Retrieve the list of seats and other attributes from the request
    List<Seat> seats = (List<Seat>) request.getAttribute("seats");
    String movieName = (String) request.getAttribute("movieName");
    String cinemaName = (String) request.getAttribute("cinemaName");
    String screenName = (String) request.getAttribute("screenName");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/selectSeat.css">
        <title>Select Seat</title>
    </head>
    <body>
        <header class="header">
            <h1>Select Seat</h1>
        </header>

        <nav id="main-nav">
            <a href="index.jsp">Home</a>
            <a href="movies.jsp">Movies</a>
            <a href="contact.jsp">Contact</a>
        </nav>

        <div class="container">
            <div class="movie-info">
                <h2>Movie: <%= movieName %></h2>
                <p><strong>Cinema:</strong> <%= cinemaName %></p>
                <p><strong>Screen:</strong> <%= screenName %></p>
            </div>

            <form action="confirmBooking" method="post">
                <div class="seats-container">
                    <%
                        if (seats != null) {
                            char currentRow = ' ';
                            for (Seat seat : seats) {
                                if (seat.getSeatNumber().charAt(0) != currentRow) {
                                    if (currentRow != ' ') {
                    %>
                </div>
                <%
                                }
                                currentRow = seat.getSeatNumber().charAt(0);
                %>
                <div class="seat-row">
                    <%
                                }
                    %>
                    <div class="seat <%= seat.getSeatType().equalsIgnoreCase("VIP") ? "vip-seat" : "regular-seat" %>">
                        <input type="checkbox" id="seat<%= seat.getSeatID() %>" name="seatIds" value="<%= seat.getSeatID() %>">
                        <label for="seat<%= seat.getSeatID() %>"><%= seat.getSeatNumber() %></label>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
        </div>
        <div class="seat-note">
            <div class="seat regular-seat"></div> Standard
            <div class="seat vip-seat"></div> VIP
        </div>
        <div class="confirm-booking-button-container">
            <button type="submit" class="confirm-booking-button">Confirm Booking</button>
        </div>
    </form>
</div>

<footer class="footer">
    <div class="contact-container">
        <div class="contact-info">
            <h2>LIÊN HỆ</h2>
            <p>
                CÔNG TY CỔ PHẦN XYZ TECHNOLOGIES<br><br>
                Giấy chứng nhận ĐKKD số: 0101234567 - Đăng ký lần đầu ngày 01/01/2015 tại Sở Kế hoạch và Đầu
                tư Thành phố Hồ Chí Minh<br><br>
                Địa chỉ trụ sở: Tầng 2, số 123, đường Nguyễn Trãi, phường 5, quận 3, thành phố Hồ Chí
                Minh<br><br>
                Hotline: 1800 123 456 / 0901 234 567<br><br>
                Email: contact@xyztechnologies.vn
            </p>
        </div>
        <div class="business-contact">
            <h2>HỢP TÁC KINH DOANH:</h2>
            <p>
                Hotline: 1800 987 654<br><br>
                Email: partnership@xyzgroup.vn
            </p>
        </div>
    </div>
</footer>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const checkboxes = document.querySelectorAll('.seat input[type="checkbox"]');
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function () {
                if (this.checked) {
                    this.parentElement.classList.add('selected-seat');
                } else {
                    this.parentElement.classList.remove('selected-seat');
                }
            });
        });
    });
</script>
</body>
</html>