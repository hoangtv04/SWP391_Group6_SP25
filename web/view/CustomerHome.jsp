<%-- 
    Document   : CustomerHome
    Created on : Mar 1, 2025, 11:18:29 PM
    Author     : tovie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Customer"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Home</title>
    </head>
    <body>
        <h1>Customer Details</h1>
        <%
            Customer customer = (Customer) request.getAttribute("customer");
            if (customer != null) {
        %>
            <p><strong>Name:</strong> <%= customer.getCustomerName() %></p>
            <p><strong>Email:</strong> <%= customer.getEmail() %></p>
            <p><strong>Phone:</strong> <%= customer.getPhone() %></p>
            <p><strong>Address:</strong> <%= customer.getAddress() %></p>
        <%
            } else {
        %>
            <p>No customer found with ID 1.</p>
        <%
            }
        %>
    </body>
</html>
