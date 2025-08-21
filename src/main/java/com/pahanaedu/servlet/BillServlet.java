package com.pahanaedu.servlet;

import com.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.dao.ItemDAO;
import com.pahanaedu.dao.PurchaseDAO;
import com.pahanaedu.dao.BillDAO;
import com.pahanaedu.model.Customer;
import com.pahanaedu.model.Item;
import com.pahanaedu.model.Purchase;
import com.pahanaedu.model.Bill;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/bill")
public class BillServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("BillServlet doGet: action = " + action);
        try {
            if ("list".equals(action)) {
                BillDAO billDAO = new BillDAO();
                List<Bill> bills = billDAO.getAllBills();
                request.setAttribute("bills", bills);
                request.getRequestDispatcher("savedBills.jsp").forward(request, response);
            } else if ("editBill".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                BillDAO billDAO = new BillDAO();
                Bill bill = billDAO.getBillById(id);
                if (bill != null) {
                    CustomerDAO customerDAO = new CustomerDAO();
                    Customer customer = customerDAO.getCustomerByAccount(bill.getCustomerId());
                    request.setAttribute("bill", bill);
                    request.setAttribute("customer", customer);
                    request.getRequestDispatcher("editBill.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Bill not found");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            } else if ("deleteBill".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                BillDAO billDAO = new BillDAO();
                billDAO.deleteBill(id);
                response.sendRedirect("bill?action=list");
            } else if ("printBill".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                BillDAO billDAO = new BillDAO();
                Bill bill = billDAO.getBillById(id);
                if (bill != null) {
                    CustomerDAO customerDAO = new CustomerDAO();
                    Customer customer = customerDAO.getCustomerByAccount(bill.getCustomerId());
                    PurchaseDAO purchaseDAO = new PurchaseDAO();
                    List<Purchase> purchases = purchaseDAO.getPurchasesByCustomer(bill.getCustomerId());
                    request.setAttribute("customer", customer);
                    request.setAttribute("purchases", purchases);
                    request.setAttribute("billAmount", bill.getTotalAmount());
                    request.setAttribute("billDate", bill.getBillDate());
                    request.getRequestDispatcher("printBill.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Bill not found");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            } else {
                String accountStr = request.getParameter("accountNumber");
                if (accountStr == null || accountStr.trim().isEmpty()) {
                    request.setAttribute("error", "Account number is required");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                    return;
                }
                int accountNumber = Integer.parseInt(accountStr);
                CustomerDAO customerDAO = new CustomerDAO();
                Customer customer = customerDAO.getCustomerByAccount(accountNumber);
                if (customer != null) {
                    PurchaseDAO purchaseDAO = new PurchaseDAO();
                    List<Purchase> purchases = purchaseDAO.getPurchasesByCustomer(accountNumber);
                    double billAmount = 0.0;
                    for (Purchase p : purchases) {
                        billAmount += p.getQuantity() * p.getItemPrice();
                    }
                    ItemDAO itemDAO = new ItemDAO();
                    List<Item> allItems = itemDAO.getAllItems();
                    request.setAttribute("customer", customer);
                    request.setAttribute("purchases", purchases);
                    request.setAttribute("billAmount", billAmount);
                    request.setAttribute("allItems", allItems);
                    request.getRequestDispatcher("bill.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Customer not found");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            System.err.println("BillServlet doGet error: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Error processing bill: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("BillServlet doPost: action = " + action);
        try {
            if ("saveBill".equals(action)) {
                int customerId = Integer.parseInt(request.getParameter("customerAccount"));
                double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
                Bill bill = new Bill();
                bill.setCustomerId(customerId);
                bill.setTotalAmount(totalAmount);
                bill.setBillDate(new Date(System.currentTimeMillis()));
                BillDAO billDAO = new BillDAO();
                billDAO.addBill(bill);
                System.out.println("Bill saved with ID: " + bill.getId());
                request.getSession().setAttribute("successMessage", "Bill saved successfully!");
                response.sendRedirect("bill?action=list");
            } else if ("updateBill".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
                BillDAO billDAO = new BillDAO();
                Bill bill = billDAO.getBillById(id);
                if (bill != null) {
                    bill.setTotalAmount(totalAmount);
                    billDAO.updateBill(bill);
                    System.out.println("Bill updated with ID: " + id);
                    response.sendRedirect("bill?action=list");
                } else {
                    request.setAttribute("error", "Bill not found");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            System.err.println("BillServlet doPost error: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Error processing bill: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}