package dc.human.gbnb.humanConnect.volunteer.vo;

import org.springframework.stereotype.Component;


@Component("centerListVO")
public class CenterListVO {
//
	private String u_id;
	private String c_name;
	private String visit_date;
	private String visit_time;
	private int select;
	private int c_id;
	private String c_phone;
	private String c_addr1;


	//
	public CenterListVO(){

		System.out.println("CenterListVO 생성자 호출");

	}

	public int getSelect() {
		return select;
	}

	public void setSelect(int select) {
		this.select = select;
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public String getC_phone() {
		return c_phone;
	}

	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}

	public String getC_addr1() {
		return c_addr1;
	}

	public void setC_addr1(String c_addr1) {
		this.c_addr1 = c_addr1;
	}


	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getVisit_date() {
		return visit_date;
	}

	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}

	public String getVisit_time() {
		return visit_time;
	}

	public void setVisit_time(String visit_time) {
		this.visit_time = visit_time;
	}
}
