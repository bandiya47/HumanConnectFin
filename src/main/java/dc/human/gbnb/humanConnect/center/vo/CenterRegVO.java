package dc.human.gbnb.humanConnect.center.vo;

import org.springframework.stereotype.Component;


@Component("centerRegVO")
public class CenterRegVO {
//
	private String uId;
	private String vTitle;
	private String vStartDate;
	private String vEndDate;
	private String vStartTime;
	private String vLastTime;
	private String vRStartDate;
	private String vREndDate;
	private String vWorkingDay;
	private int vServiceCode;
	private String vServiceType;
	private int vMaxAmnt;
	private int vRegAmnt;
	private int vState;
	private String vUploadFilePath;
	private String vInfo;
	private int v_no;
	private String cName;
	private String cAddr1;
	private String cAddr2;

	//
	public CenterRegVO(){

		System.out.println("CenterRegVO 생성자 호출");

	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcAddr1() {
		return cAddr1;
	}

	public void setcAddr1(String cAddr1) {
		this.cAddr1 = cAddr1;
	}

	public String getcAddr2() {
		return cAddr2;
	}

	public void setcAddr2(String cAddr2) {
		this.cAddr2 = cAddr2;
	}

	public String getvServiceType() {
		return vServiceType;
	}

	public void setvServiceType(String vServiceType) {
		this.vServiceType = vServiceType;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getvTitle() {
		return vTitle;
	}

	public void setvTitle(String vTitle) {
		this.vTitle = vTitle;
	}

	public String getvStartDate() {
		return vStartDate;
	}

	public void setvStartDate(String vStartDate) {
		this.vStartDate = vStartDate;
	}

	public String getvEndDate() {
		return vEndDate;
	}

	public void setvEndDate(String vEndDate) {
		this.vEndDate = vEndDate;
	}

	public String getvStartTime() {
		return vStartTime;
	}

	public void setvStartTime(String vStartTime) {
		this.vStartTime = vStartTime;
	}

	public String getvLastTime() {
		return vLastTime;
	}

	public void setvLastTime(String vLastTime) {
		this.vLastTime = vLastTime;
	}

	public String getvRStartDate() {
		return vRStartDate;
	}

	public void setvRStartDate(String vRStartDate) {
		this.vRStartDate = vRStartDate;
	}

	public String getvREndDate() {
		return vREndDate;
	}

	public void setvREndDate(String vREndDate) {
		this.vREndDate = vREndDate;
	}

	public String getvWorkingDay() {
		return vWorkingDay;
	}

	public void setvWorkingDay(String vWorkingDay) {
		this.vWorkingDay = vWorkingDay;
	}

	public int getvServiceCode() {
		return vServiceCode;
	}

	public void setvServiceCode(int vServiceCode) {
		this.vServiceCode = vServiceCode;
	}

	public int getvMaxAmnt() {
		return vMaxAmnt;
	}

	public void setvMaxAmnt(int vMaxAmnt) {
		this.vMaxAmnt = vMaxAmnt;
	}

	public int getvRegAmnt() {
		return vRegAmnt;
	}

	public void setvRegAmnt(int vRegAmnt) {
		this.vRegAmnt = vRegAmnt;
	}

	public int getvState() {
		return vState;
	}

	public void setvState(int vState) {
		this.vState = vState;
	}

	public String getvUploadFilePath() {
		return vUploadFilePath;
	}

	public void setvUploadFilePath(String vUploadFilePath) {
		this.vUploadFilePath = vUploadFilePath;
	}

	public String getvInfo() {
		return vInfo;
	}

	public void setvInfo(String vInfo) {
		this.vInfo = vInfo;
	}

	public int getV_no() {
		return v_no;
	}

	public void setV_no(int v_no) {
		this.v_no = v_no;
	}
}
