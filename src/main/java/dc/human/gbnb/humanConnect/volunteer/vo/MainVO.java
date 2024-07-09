package dc.human.gbnb.humanConnect.volunteer.vo;

public class MainVO {
//	VOLUNTEER_USER 테이블
//  개인정보 확인 및 수정
	private  int vreg_no;
	private String v_no;
	private String v_title;
	private String vreg_start_date;
	private String vreg_end_date;
	private String v_rend_date;
	private String v_rstart_date;
	private String v_start_date;
	private String c_name;
	private String c_phone;
	private String c_addr1;
	private String service_type;
	private String visit_time;
	private String visit_date;
	//private String v_state;


	public String getVisit_time() {
		return visit_time;
	}

	public void setVisit_time(String visit_time) {
		this.visit_time = visit_time;
	}

	public String getVisit_date() {
		return visit_date;
	}

	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}


	private String u_id;

	public int getVreg_no() {return vreg_no;}

	public void setVreg_no(int vreg_no) {this.vreg_no = vreg_no;}

	public String getV_no() {
		return v_no;
	}

	public void setV_no(String v_no) {
		this.v_no = v_no;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getV_title() {
		return v_title;
	}

	public void setV_title(String v_title) {
		this.v_title = v_title;
	}

	public String getVreg_start_date() {
		return vreg_start_date;
	}

	public void setVreg_start_date(String vreg_start_date) {
		this.vreg_start_date = vreg_start_date;
	}

	public String getVreg_end_date() {
		return vreg_end_date;
	}

	public void setVreg_end_date(String vreg_end_date) {
		this.vreg_end_date = vreg_end_date;
	}

	public String getV_rend_date() {
		return v_rend_date;
	}

	public void setV_rend_date(String v_rend_date) {
		this.v_rend_date = v_rend_date;
	}

	public String getV_rstart_date() {
		return v_rstart_date;
	}

	public void setV_rstart_date(String v_rstart_date) {
		this.v_rstart_date = v_rstart_date;
	}

	public String getV_start_date() {
		return v_start_date;
	}

	public void setV_start_date(String v_start_date) {
		this.v_start_date = v_start_date;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
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

	public String getService_type() {
		return service_type;
	}

	public void setService_type(String service_type) {
		this.service_type = service_type;
	}



}
