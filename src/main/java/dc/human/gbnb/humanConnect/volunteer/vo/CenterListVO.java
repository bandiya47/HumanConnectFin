package dc.human.gbnb.humanConnect.volunteer.vo;

import org.springframework.stereotype.Component;


@Component("centerListVO")
public class CenterListVO {
//
	private String u_id;
	private String c_name;
	private String visit_date;
	private String visit_time;


	//
	public CenterListVO(){

		System.out.println("CenterListVO 생성자 호출");

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
