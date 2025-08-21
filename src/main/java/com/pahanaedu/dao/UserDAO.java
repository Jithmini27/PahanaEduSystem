package com.pahanaedu.dao;

import com.pahanaedu.model.User;
import com.pahanaedu.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    public User validate(String username, String password) {
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            // Trim inputs to avoid accidental spaces
            ps.setString(1, username.trim());
            ps.setString(2, password.trim());

            // Debug print
            System.out.println("Executing SQL: SELECT * FROM users WHERE username='"
                    + username.trim() + "' AND password='" + password.trim() + "'");

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                System.out.println("User found: " + rs.getString("username"));
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                return user;
            } else {
                System.out.println("No user found for: '" + username + "'");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
