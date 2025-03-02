package controller;

import dal.SeatDAO;
import model.Seat;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class SelectSeatServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int movieId = Integer.parseInt(request.getParameter("movieId"));
            String movieName = request.getParameter("movieName");
            int cinemaId = Integer.parseInt(request.getParameter("cinemaId"));
            String cinemaName = request.getParameter("cinemaName");
            int screenId = Integer.parseInt(request.getParameter("screenId"));
            String screenName = request.getParameter("screenName");

            SeatDAO seatDAO = new SeatDAO();
            List<Seat> seats = seatDAO.getSeatsByMovieCinemaScreen(movieId, cinemaId, screenId);
            request.setAttribute("seats", seats);
            request.setAttribute("movieId", movieId);
            request.setAttribute("movieName", movieName);
            request.setAttribute("cinemaId", cinemaId);
            request.setAttribute("cinemaName", cinemaName);
            request.setAttribute("screenId", screenId);
            request.setAttribute("screenName", screenName);
            request.getRequestDispatcher("/selectSeat.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameters");
        }
    }
}