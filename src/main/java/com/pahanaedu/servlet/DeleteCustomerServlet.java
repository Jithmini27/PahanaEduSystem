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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountStr = request.getParameter("accountNumber");
        if (accountStr == null || accountStr.trim().isEmpty()) {
            request.setAttribute("error", "Account number is required");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
        try {
            int accountNumber = Integer.parseInt(accountStr);
            CustomerDAO dao = new CustomerDAO();
            // Check if customer exists
            if (dao.getCustomerByAccount(accountNumber) != null) {
                dao.deleteCustomer(accountNumber);
                response.sendRedirect("customerList");
            } else {
                request.setAttribute("error", "Customer not found");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid account number format");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error deleting customer: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}