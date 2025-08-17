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
        try {
            int accountNumber = Integer.parseInt(request.getParameter("accountNumber"));
            CustomerDAO dao = new CustomerDAO();
            Customer customer = dao.getCustomerByAccount(accountNumber);
            if (customer != null) {
                request.setAttribute("customer", customer);
                request.getRequestDispatcher("editCustomer.jsp").forward(request, response);
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Customer customer = new Customer();
            customer.setAccountNumber(Integer.parseInt(request.getParameter("accountNumber")));
            customer.setName(request.getParameter("name"));
            customer.setAddress(request.getParameter("address"));
            customer.setTelephone(request.getParameter("telephone"));
            customer.setUnitsConsumed(Integer.parseInt(request.getParameter("unitsConsumed")));

            CustomerDAO dao = new CustomerDAO();
            dao.updateCustomer(customer);
            response.sendRedirect("customerList");
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input format");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}