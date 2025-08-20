package com.pahanaedu.dao;

import com.pahanaedu.model.Purchase;
import com.pahanaedu.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PurchaseDAO {
    public void addPurchase(Purchase purchase) {
        String sql = "INSERT INTO purchases (customer_account, item_id, quantity) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, purchase.getCustomerAccount());
            ps.setInt(2, purchase.getItemId());
            ps.setInt(3, purchase.getQuantity());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updatePurchase(Purchase purchase) {
        String sql = "UPDATE purchases SET quantity = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, purchase.getQuantity());
            ps.setInt(2, purchase.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deletePurchase(int id) {
        String sql = "DELETE FROM purchases WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Purchase> getPurchasesByCustomer(int customerAccount) {
        List<Purchase> purchases = new ArrayList<>();
        String sql = "SELECT p.id, p.customer_account, p.item_id, p.quantity, i.name AS item_name, i.price AS item_price " +
                "FROM purchases p JOIN items i ON p.item_id = i.id WHERE p.customer_account = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, customerAccount);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Purchase pur = new Purchase();
                pur.setId(rs.getInt("id"));
                pur.setCustomerAccount(rs.getInt("customer_account"));
                pur.setItemId(rs.getInt("item_id"));
                pur.setQuantity(rs.getInt("quantity"));
                pur.setItemName(rs.getString("item_name"));
                pur.setItemPrice(rs.getDouble("item_price"));
                purchases.add(pur);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return purchases;
    }
}