package com.pahanaedu.servlet;

import com.pahanaedu.dao.PurchaseDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deletePurchase")
public class DeletePurchaseServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            int customerAccount = Integer.parseInt(request.getParameter("customerAccount"));
            PurchaseDAO dao = new PurchaseDAO();
            dao.deletePurchase(id);
            response.sendRedirect("bill?accountNumber=" + customerAccount);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}