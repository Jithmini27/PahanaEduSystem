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
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            ItemDAO dao = new ItemDAO();
            Item item = dao.getItemById(id);
            if (item != null) {
                request.setAttribute("item", item);
                request.getRequestDispatcher("editItem.jsp").forward(request, response);
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp");
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
        }
    }
}