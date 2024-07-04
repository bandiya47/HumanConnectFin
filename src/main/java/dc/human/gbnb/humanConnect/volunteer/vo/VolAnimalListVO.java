package dc.human.gbnb.humanConnect.volunteer.vo;

public class VolAnimalListVO {
    private String desertionNo;
    private String kindCd;
    private String sexCd;
    private String careAddr;
    private String popfile;

    // 기본 생성자
    public VolAnimalListVO() {}

    // 매개 변수를 받는 생성자
    public VolAnimalListVO(String desertionNo, String kindCd, String sexCd, String careAddr, String popfile) {
        this.desertionNo = desertionNo;
        this.kindCd = kindCd;
        this.sexCd = sexCd;
        this.careAddr = careAddr;
        this.popfile = popfile;
    }

    // Getters and setters

    public String getDesertionNo() {
        return desertionNo;
    }

    public void setDesertionNo(String desertionNo) {
        this.desertionNo = desertionNo;
    }

    public String getKindCd() {
        return kindCd;
    }

    public void setKindCd(String kindCd) {
        this.kindCd = kindCd;
    }

    public String getSexCd() {
        return sexCd;
    }

    public void setSexCd(String sexCd) {
        this.sexCd = sexCd;
    }

    public String getCareAddr() {
        return careAddr;
    }

    public void setCareAddr(String careAddr) {
        this.careAddr = careAddr;
    }

    public String getPopfile() {
        return popfile;
    }

    public void setPopfile(String popfile) {
        this.popfile = popfile;
    }
}
