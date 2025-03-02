/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DBContext;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 *
 * @author tovie
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServletController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        // Validate phone number and address
        if (!phone.matches("\\d{9,10}")) {
            request.setAttribute("registerErrorMessage", "Phone number incorrect. Please enter again.");
            request.setAttribute("showRegisterForm", true);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        if (address.length() > 255) {
            request.setAttribute("registerErrorMessage", "Address is too long. Please enter a shorter address.");
            request.setAttribute("showRegisterForm", true);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        try {
            Connection conn = new DBContext().getConnection();
            String sql = "INSERT INTO Customer (CustomerName, Password, Email, Phone, Address) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, address);
            ps.executeUpdate();

            // Set success message and forward to Login.jsp
            request.setAttribute("successMessage", "Register Successful. Please Login");
            request.setAttribute("showRegisterForm", true);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("registerErrorMessage", "Registration failed. Please try again.");
            request.setAttribute("showRegisterForm", true);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServletController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServletController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public String getServletInfo() {
        return "Short description";
    }
}
