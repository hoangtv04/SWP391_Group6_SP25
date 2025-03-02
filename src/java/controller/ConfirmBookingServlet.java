package controller;

import dal.SeatDAO;
import model.Seat;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ConfirmBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String movieName = request.getParameter("movieName");
            String cinemaName = request.getParameter("cinemaName");
            String screenName = request.getParameter("screenName");
            String[] seatIds = request.getParameterValues("seatIds");

            SeatDAO seatDAO = new SeatDAO();
            List<Seat> selectedSeats = new ArrayList<>();
            if (seatIds != null) {
                selectedSeats = seatDAO.getSeatsByIds(seatIds);
            }

            request.setAttribute("movieName", movieName);
            request.setAttribute("cinemaName", cinemaName);
            request.setAttribute("screenName", screenName);
            request.setAttribute("selectedSeats", selectedSeats);

            request.getRequestDispatcher("/confirmBooking.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameters");
        }
    }
}