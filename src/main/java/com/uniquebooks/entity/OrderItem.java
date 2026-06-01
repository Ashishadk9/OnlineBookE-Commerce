package com.uniquebooks.entity;

public class OrderItem {
    private int id;
    private int orderId;
    private int bookId;
    private int quantity;
    private double price;
    private String bookTitle;

    //Default constructor (required for jsp)
    public  OrderItem() {
    }

    //Parameterized constructor (optional)
    public OrderItem(int id, int orderId, int bookId, int quantity, double price, String bookTitle) {
        this.id = id;
        this.orderId = orderId;
        this.bookId = bookId;
        this.quantity = quantity;
        this.price = price;
        this.bookTitle = bookTitle;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getOrderId() {
        return orderId;
    }
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
    public int getBookId() {
        return bookId;
    }
    public void setBookId(int bookId) {
        this.bookId = bookId;
    }
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }
    public String getBookTitle() {
        return bookTitle;
    }
    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }
}

