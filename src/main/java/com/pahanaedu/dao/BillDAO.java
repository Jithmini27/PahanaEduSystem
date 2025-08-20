package com.pahanaedu.dao;

import com.pahanaedu.model.Bill;
import com.pahanaedu.model.Customer;
import com.pahanaedu.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BillDAO {
    public void addBill(Bill bill) {
        String sql = "INSERT INTO bills (customer_id, total_amount, bill_date) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, bill.getCustomerId());
            ps.setDouble(2, bill.getTotalAmount());
            ps.setDate(3, bill.getBillDate());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Bill added successfully: Customer ID = " + bill.getCustomerId() + ", Total = " + bill.getTotalAmount());
            } else {
                System.out.println("Failed to add bill: No rows affected");
            }
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                bill.setId(rs.getInt(1));
            }
        } catch (SQLException e) {
            System.err.println("Error adding bill: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error adding bill: " + e.getMessage());
        }
    }

    public void updateBill(Bill bill) {
        String sql = "UPDATE bills SET total_amount = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDouble(1, bill.getTotalAmount());
            ps.setInt(2, bill.getId());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Bill updated successfully: ID = " + bill.getId());
            } else {
                System.out.println("Failed to update bill: No rows affected");
            }
        } catch (SQLException e) {
            System.err.println("Error updating bill: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error updating bill: " + e.getMessage());
        }
    }

    public void deleteBill(int id) {
        String sql = "DELETE FROM bills WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Bill deleted successfully: ID = " + id);
            } else {
                System.out.println("Failed to delete bill: No rows affected");
            }
        } catch (SQLException e) {
            System.err.println("Error deleting bill: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error deleting bill: " + e.getMessage());
        }
    }

    public List<Bill> getAllBills() {
        List<Bill> bills = new ArrayList<>();
        String sql = "SELECT b.*, c.name FROM bills b JOIN customers c ON b.customer_id = c.account_number ORDER BY b.bill_date DESC";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setId(rs.getInt("id"));
                bill.setCustomerId(rs.getInt("customer_id"));
                bill.setTotalAmount(rs.getDouble("total_amount"));
                bill.setBillDate(rs.getDate("bill_date"));
                Customer customer = new Customer();
                customer.setName(rs.getString("name"));
                bill.setCustomer(customer);
                bills.add(bill);
            }
            System.out.println("Fetched " + bills.size() + " bills from database");
        } catch (SQLException e) {
            System.err.println("Error fetching bills: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error fetching bills: " + e.getMessage());
        }
        return bills;
    }

    public Bill getBillById(int id) {
        Bill bill = null;
        String sql = "SELECT b.*, c.name FROM bills b JOIN customers c ON b.customer_id = c.account_number WHERE b.id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                bill = new Bill();
                bill.setId(rs.getInt("id"));
                bill.setCustomerId(rs.getInt("customer_id"));
                bill.setTotalAmount(rs.getDouble("total_amount"));
                bill.setBillDate(rs.getDate("bill_date"));
                Customer customer = new Customer();
                customer.setName(rs.getString("name"));
                bill.setCustomer(customer);
            } else {
                System.out.println("No bill found with ID: " + id);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching bill: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error fetching bill: " + e.getMessage());
        }
        return bill;
    }
}