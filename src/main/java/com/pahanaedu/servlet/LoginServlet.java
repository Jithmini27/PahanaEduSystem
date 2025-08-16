package com.pahanaedu.servlet;

import com.pahanaedu.dao.UserDAO;
import com.pahanaedu.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Hardcoded credentials for testing
        String username = "admin";
        String password = "admin123";

        System.out.println("Testing login with:");
        System.out.println("Username: " + username);
        System.out.println("Password: " + password);

        // For hardcoded test, skip the database check and just create the User object directly
        User user = new User();
        user.setId(1); // admin ID
        user.setUsername(username);
        user.setPassword(password);

        // Start session and redirect to dashboard
        HttpSession session = request.getSession();
        session.setAttribute("loggedIn", true);
        session.setAttribute("user", user);

        response.sendRedirect("dashboard.jsp");
    }
}
