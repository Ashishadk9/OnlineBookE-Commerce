package com.uniquebooks.entity;

import java.util.Date;

public class Order {
    private  int id;
    private String orderNumber;
    private int userId;
    private Date orderDate;
    private double totalAmount;
    private String status;
    private String customerName;

    // default constructor
    public Order(){

    }

    // constructor
    public Order(int id, String orderNumber, int userId, Date orderDate, double totalAmount, String status, String customerName) {
        this.id = id;
        this.orderNumber = orderNumber;
        this.userId = userId;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
        this.status = status;
        this.customerName = customerName;
    }
    //getters and setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getOrderNumber() {
        return orderNumber;
    }
    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public Date getOrderDate() {
        return orderDate;
    }
    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
    public double getTotalAmount() {
        return totalAmount;
    }
    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getCustomerName() {
        return customerName;
    }
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    //toString for debugging
    @Override
    public String toString() {
        return "Order{" + "id=" + id + "; orderNumber='" + orderNumber + '\'' + "; userId=" + userId + ", orderDate=" +orderDate+ ", totalAmount=" + totalAmount + ", status=" + status + ", customerName=" + customerName + '\'' + '}';
    }
}
