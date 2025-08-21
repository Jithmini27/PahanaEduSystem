package com.pahanaedu.servlet;

import com.pahanaedu.dao.PurchaseDAO;
import com.pahanaedu.model.Purchase;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/editPurchase")
public class EditPurchaseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Purchase purchase = new Purchase();
            purchase.setId(Integer.parseInt(request.getParameter("id")));
            purchase.setQuantity(Integer.parseInt(request.getParameter("quantity")));
            int customerAccount = Integer.parseInt(request.getParameter("customerAccount"));

            PurchaseDAO dao = new PurchaseDAO();
            dao.updatePurchase(purchase);
            response.sendRedirect("bill?accountNumber=" + customerAccount);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}