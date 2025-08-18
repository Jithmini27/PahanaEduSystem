package com.pahanaedu.servlet;

import com.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/bill")
public class BillServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int accountNumber = Integer.parseInt(request.getParameter("accountNumber"));
            CustomerDAO dao = new CustomerDAO();
            Customer customer = dao.getCustomerByAccount(accountNumber);
            if (customer != null) {
                double rate = 10.0; // Fixed rate per unit; adjust as needed
                double billAmount = customer.getUnitsConsumed() * rate;
                request.setAttribute("customer", customer);
                request.setAttribute("billAmount", billAmount);
                request.getRequestDispatcher("bill.jsp").forward(request, response);
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp");
        }
    }
}