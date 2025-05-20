package Model;

public class Payment {
    private int id;
    private int userId;
    private String method;
    private String cardNumber;
    private double amount;
    private String date;
    private String status;

    public Payment() {}

    public Payment(int userId, String method, String cardNumber, double amount, String date) {
        this.userId = userId;
        this.method = method;
        this.cardNumber = cardNumber;
        this.amount = amount;
        this.date = date;
    }

    public Payment(int id, int userId, double amount, String method, String date, String status) {
        this.id = id;
        this.userId = userId;
        this.amount = amount;
        this.method = method;
        this.date = date;
        this.status = status;
    }

    public Payment(int id, int userId, String method, String cardNumber, double amount, String date, String status) {
        this.id = id;
        this.userId = userId;
        this.method = method;
        this.cardNumber = cardNumber;
        this.amount = amount;
        this.date = date;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPaymentMethod() {
        return method;
    }

    public String getPaymentDate() {
        return date;
    }

    public String getStatus() {
        return status;
    }
}
