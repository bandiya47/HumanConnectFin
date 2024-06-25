package dc.human.gbnb.humanConnect.volunteer.vo;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {

	private String u_id;
	private String u_name;
	private String u_sex;
	private String u_bdate;
	private String u_pwd;
	private String u_addr1;
	private String u_addr2;
	private String u_email;
	private String u_phone;
	private String u_type;

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_sex() {
		return u_sex;
	}

	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
	}

	public String getU_bdate() {
		return u_bdate;
	}

	public void setU_bdate(String u_bdate) {
		this.u_bdate = u_bdate;
	}

	public String getU_pwd() {
		return u_pwd;
	}

	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}


	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public String getU_type() {
		return u_type;
	}

	public void setU_type(String u_type) {
		this.u_type = u_type;
	}

	public String getU_addr1() {
		return u_addr1;
	}

	public void setU_addr1(String u_addr1) {
		this.u_addr1 = u_addr1;
	}

	public String getU_addr2() {
		return u_addr2;
	}

	public void setU_addr2(String u_addr2) {
		this.u_addr2 = u_addr2;
	}





	public MemberVO() {
		System.out.println("MemberVO 생성자 호출");
	}
	
	

	
	
}
