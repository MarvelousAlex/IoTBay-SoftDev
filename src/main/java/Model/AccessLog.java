package Model;

import java.sql.Timestamp;
import java.io.Serializable;

public class AccessLog implements Serializable {
    private Timestamp accessTime;
    private String action;

    // Getters and Setters
    public Timestamp getAccessTime() {
        return accessTime;
    }

    public void setAccessTime(Timestamp accessTime) {
        this.accessTime = accessTime;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }
}

