package dc.human.gbnb.humanConnect.center.vo;

public class CenterMainVO {
    private String userId; //봉사자 아이디
    private String name; //봉사자 이름
    private String phone; //봉사자 핸드폰
    private String status;//승인 결과
    private String rejectReason;//거절 사유


    public CenterMainVO() {
    }


    public CenterMainVO(String userId, String name, String phone) {
        this.userId = userId;
        this.name = name;
        this.phone = phone;
    }

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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRejectReason() {
        return rejectReason;
    }

    public void setRejectReason(String rejectReason) {
        this.rejectReason = rejectReason;
    }
}
