package com.mycompany.beans;

import java.io.Serializable;

public class OrderBean implements Serializable {
    private static final long serialVersionUID = 1L;

    private int    id;
    private String product;
    private int    quantity;
    private String orderDate;
    private String status;

    public OrderBean() { }

    // getters & setters
    public int getId()               { return id; }
    public void setId(int id)        { this.id = id; }

    public String getProduct()       { return product; }
    public void setProduct(String p) { this.product = p; }

    public int getQuantity()         { return quantity; }
    public void setQuantity(int q)   { this.quantity = q; }

    public String getOrderDate()          { return orderDate; }
    public void setOrderDate(String d)    { this.orderDate = d; }

    public String getStatus()          { return status; }
    public void setStatus(String s)    { this.status = s; }
}
