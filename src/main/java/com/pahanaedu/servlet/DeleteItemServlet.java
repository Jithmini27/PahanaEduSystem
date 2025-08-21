package com.pahanaedu.servlet;

import com.pahanaedu.dao.ItemDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteItem")
public class DeleteItemServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            ItemDAO dao = new ItemDAO();
            dao.deleteItem(id);
            response.sendRedirect("itemList");
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp");
        }
    }
}