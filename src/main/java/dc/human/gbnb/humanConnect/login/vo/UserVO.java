package dc.human.gbnb.humanConnect.login.vo;

public class UserVO {

    private String userId; //사용자 아이디 (봉사자 / 센터)
    private String password; // 사용자 비밀번호 (봉사자 / 센터)
    private String name; // 사용자 이름 (봉사자 / 센터)
    private String addr; // 사용자 주소 (봉사자 / 센터)
    private String email; // 사용자 이메일 (봉사자 / 센터)
    private String phone; // 사용자 전화번호 (봉사자 / 센터)


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
