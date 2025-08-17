package com.pahanaedu.servlet;

import com.pahanaedu.dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteCustomer")
public class DeleteCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int accountNumber = Integer.parseInt(request.getParameter("accountNumber"));
            CustomerDAO dao = new CustomerDAO();
            dao.deleteCustomer(accountNumber);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        response.sendRedirect("customerList");
    }
}
