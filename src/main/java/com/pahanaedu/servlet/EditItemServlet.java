package com.pahanaedu.servlet;

import com.pahanaedu.dao.ItemDAO;
import com.pahanaedu.model.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/editItem")
public class EditItemServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.trim().isEmpty()) {
            request.setAttribute("error", "Item ID is required");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
        try {
            int id = Integer.parseInt(idStr);
            ItemDAO dao = new ItemDAO();
            Item item = dao.getItemById(id);
            if (item != null) {
                request.setAttribute("item", item);
                request.getRequestDispatcher("editItem.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Item not found");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid item ID format");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Item item = new Item();
            item.setId(Integer.parseInt(request.getParameter("id")));
            item.setName(request.getParameter("name"));
            item.setPrice(Double.parseDouble(request.getParameter("price")));
            item.setStock(Integer.parseInt(request.getParameter("stock")));

            ItemDAO dao = new ItemDAO();
            dao.updateItem(item);
            response.sendRedirect("itemList");
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input format");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error updating item: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}