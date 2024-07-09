package dc.human.gbnb.humanConnect.center.vo;

public class CenterMainVO {
    private String userId;
    private String name;
    private String phone;
    private int status;
    private String rejectReason;
    private String title;
    private String resNo;

    // 생성자, getter, setter

    public CenterMainVO() {}

    public CenterMainVO(String userId, String name, String phone, String title, String resNo) {
        this.userId = userId;
        this.name = name;
        this.phone = phone;
        this.title = title;
        this.resNo = resNo;
    }

    // Getters and Setters

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getRejectReason() {
        return rejectReason;
    }

    public void setRejectReason(String rejectReason) {
        this.rejectReason = rejectReason;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getResNo() {
        return resNo;
    }

    public void setResNo(String resNo) {
        this.resNo = resNo;
    }
}