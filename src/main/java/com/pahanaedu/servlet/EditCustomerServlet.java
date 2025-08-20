package com.pahanaedu.servlet;

import com.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/editCustomer")
public class EditCustomerServlet extends HttpServlet {
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
            Customer customer = dao.getCustomerByAccount(accountNumber);
            if (customer != null) {
                request.setAttribute("customer", customer);
                request.getRequestDispatcher("editCustomer.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Customer not found");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid account number format");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Customer customer = new Customer();
            customer.setAccountNumber(Integer.parseInt(request.getParameter("accountNumber")));
            customer.setName(request.getParameter("name"));
            customer.setAddress(request.getParameter("address"));
            customer.setTelephone(request.getParameter("telephone"));

            CustomerDAO dao = new CustomerDAO();
            dao.updateCustomer(customer);
            response.sendRedirect("customerList");
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input format");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error updating customer: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}