package com.pahanaedu.model;

public class Purchase {
    private int id;
    private int customerAccount;
    private int itemId;
    private int quantity;
    private String itemName;
    private double itemPrice;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getCustomerAccount() { return customerAccount; }
    public void setCustomerAccount(int customerAccount) { this.customerAccount = customerAccount; }
    public int getItemId() { return itemId; }
    public void setItemId(int itemId) { this.itemId = itemId; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }
    public double getItemPrice() { return itemPrice; }
    public void setItemPrice(double itemPrice) { this.itemPrice = itemPrice; }
}