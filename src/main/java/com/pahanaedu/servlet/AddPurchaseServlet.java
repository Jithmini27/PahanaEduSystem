package com.pahanaedu.servlet;

import com.pahanaedu.dao.PurchaseDAO;
import com.pahanaedu.model.Purchase;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/addPurchase")
public class AddPurchaseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Purchase purchase = new Purchase();
            purchase.setCustomerAccount(Integer.parseInt(request.getParameter("customerAccount")));
            purchase.setItemId(Integer.parseInt(request.getParameter("itemId")));
            purchase.setQuantity(Integer.parseInt(request.getParameter("quantity")));

            PurchaseDAO dao = new PurchaseDAO();
            dao.addPurchase(purchase);
            response.sendRedirect("bill?accountNumber=" + purchase.getCustomerAccount());
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}