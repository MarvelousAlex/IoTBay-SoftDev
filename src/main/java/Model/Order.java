package Model;

import java.io.Serializable;

public class Order implements Serializable {
    private int id;
    private int customerId;      // FK back to User.id
    private String product;      // e.g. “IoT Sensor X”
    private int    quantity;
    private String orderDate;    // you can also use java.time.LocalDate
    private String status;       // e.g. “SAVED”, “SUBMITTED”, “CANCELLED”

    // no-arg ctor for JavaBeans / your DB mapper
    public Order() { }

    // full ctor
    public Order(int id, int customerId, String product,
                 int quantity, String orderDate, String status) {
        this.id         = id;
        this.customerId = customerId;
        this.product    = product;
        this.quantity   = quantity;
        this.orderDate  = orderDate;
        this.status     = status;
    }

    // convenience ctor for “create” (DB will assign id)
    public Order(int customerId, String product,
                 int quantity, String orderDate, String status) {
        this.customerId = customerId;
        this.product    = product;
        this.quantity   = quantity;
        this.orderDate  = orderDate;
        this.status     = status;
    }

    // getters & setters
    public int getId()               { return id; }
    public void setId(int id)        { this.id = id; }

    public int getCustomerId()       { return customerId; }
    public void setCustomerId(int c) { this.customerId = c; }

    public String getProduct()             { return product; }
    public void setProduct(String product) { this.product = product; }

    public int getQuantity()           { return quantity; }
    public void setQuantity(int qty)   { this.quantity = qty; }

    public String getOrderDate()              { return orderDate; }
    public void setOrderDate(String orderDate){ this.orderDate = orderDate; }

    public String getStatus()             { return status; }
    public void setStatus(String status)  { this.status = status; }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", customerId=" + customerId +
                ", product='" + product + '\'' +
                ", quantity=" + quantity +
                ", orderDate='" + orderDate + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
