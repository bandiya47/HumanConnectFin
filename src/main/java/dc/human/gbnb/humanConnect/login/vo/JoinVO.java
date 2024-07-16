package dc.human.gbnb.humanConnect.login.vo;

import org.springframework.stereotype.Component;

@Component("JoinVO")
public class JoinVO {

    private String u_Id;
    private String u_Name;
    private String u_Sex;
    private String u_Bdate;
    private String u_Pwd;
    private String u_Addr1;
    private String u_Addr2;
    private String u_Email;
    private String u_Phone;

    public JoinVO(){

        System.out.println("JoinVO 생성자 호출");

    }

    public String getU_Name() {
        return u_Name;
    }

    public void setU_Name(String u_Name) {
        this.u_Name = u_Name;
    }

    public String getU_Id() {
        return u_Id;
    }

    public void setU_Id(String u_Id) {
        this.u_Id = u_Id;
    }

    public String getU_Sex() {
        return u_Sex;
    }

    public void setU_Sex(String u_Sex) {
        this.u_Sex = u_Sex;
    }

    public String getU_Bdate() {
        return u_Bdate;
    }

    public void setU_Bdate(String u_Bdate) {
        this.u_Bdate = u_Bdate;
    }

    public String getU_Pwd() {return u_Pwd;}

    public void setU_Pwd(String u_Pwd) {
        this.u_Pwd = u_Pwd;
    }

    public String getU_Email() {
        return u_Email;
    }

    public void setU_Email(String u_Email) {
        this.u_Email = u_Email;
    }

    public String getU_Phone() {
        return u_Phone;
    }

    public void setU_Phone(String u_Phone) {this.u_Phone = u_Phone;}

    public String getU_Addr1() {
        return u_Addr1;
    }

    public void setU_Addr1(String u_Addr1) {
        this.u_Addr1 = u_Addr1;
    }

    public String getU_Addr2() {
        return u_Addr1;
    }

    public void setU_Addr2(String u_Addr2) {
        this.u_Addr1 = u_Addr2;
    }





}
