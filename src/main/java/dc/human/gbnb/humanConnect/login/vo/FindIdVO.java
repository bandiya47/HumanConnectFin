package dc.human.gbnb.humanConnect.login.vo;

import org.springframework.stereotype.Component;

@Component("FindIdVO")
public class FindIdVO {
    private String u_Id;
    private String u_Name;
    private String u_Email;

    public FindIdVO(){

        System.out.println("FindIdVO 생성자 호출");

    }

    // Getters and Setters
    public String getU_Id() {
        return u_Id;
    }

    public void setU_Id(String u_Id) {
        this.u_Id = u_Id;
    }

    public String getU_Name() {
        return u_Name;
    }

    public void setU_Name(String u_Name) {
        this.u_Name = u_Name;
    }

    public String getU_Email() {
        return u_Email;
    }

    public void setU_Email(String u_Email) {
        this.u_Email = u_Email;
    }
}
