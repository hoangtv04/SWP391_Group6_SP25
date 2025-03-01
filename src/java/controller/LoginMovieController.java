package controller;

import dal.CustomerDAO;
import dal.AdminDAO;
import model.Customer;
import model.Admin;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet implementation class LoginMovieController
 */
@WebServlet(name = "LoginMovieController", urlPatterns = {"/login"})
public class LoginMovieController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // This method is no longer needed for login processing
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("HomePage/Login.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String username = request.getParameter("username");
        String password = request.getParameter("password");

        CustomerDAO customerDAO = new CustomerDAO();
        AdminDAO adminDAO = new AdminDAO();
        Customer customer = null;
        try {
            customer = customerDAO.getCustomerByName(username);
        } catch (Exception ex) {
            Logger.getLogger(LoginMovieController.class.getName()).log(Level.SEVERE, null, ex);
        }
        Admin admin = null;
        try {
            admin = adminDAO.getAdminByName(username);
        } catch (Exception ex) {
            Logger.getLogger(LoginMovieController.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (customer != null && customer.getPassword().equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("customer", customer);
            response.sendRedirect("view/CustomerHome.jsp"); // Redirect to customer dashboard
        } else if (admin != null && admin.getPassword().equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            response.sendRedirect("view/AdminHome.jsp"); // Redirect to admin dashboard
        } else {
            request.setAttribute("errorMessage", "Invalid username or password. Please try again.");
            request.getRequestDispatcher("HomePage/Login.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "LoginController handles login for both admin and customer.";
    }
}
