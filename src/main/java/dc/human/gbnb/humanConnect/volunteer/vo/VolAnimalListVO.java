package dc.human.gbnb.humanConnect.volunteer.vo;

public class VolAnimalListVO {
    private String desertionNo;
    private String kindCd;
    private String sexCd;
    private String careAddr;
    private String popfile;
    private String colorCd;
    private String uprCd;
    private String orgCd;

    // 생성자 및 getter, setter 추가
    public VolAnimalListVO(String desertionNo, String kindCd, String sexCd, String careAddr, String popfile, String colorCd, String uprCd, String orgCd) {
        this.desertionNo = desertionNo;
        this.kindCd = kindCd;
        this.sexCd = sexCd;
        this.careAddr = careAddr;
        this.popfile = popfile;
        this.colorCd = colorCd;
        this.uprCd = uprCd;
        this.orgCd = orgCd;
    }

    // getter 및 setter
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

    public String getColorCd() {
        return colorCd;
    }

    public void setColorCd(String colorCd) {
        this.colorCd = colorCd;
    }

    public String getUprCd() {
        return uprCd;
    }

    public void setUprCd(String uprCd) {
        this.uprCd = uprCd;
    }

    public String getOrgCd() {
        return orgCd;
    }

    public void setOrgCd(String orgCd) {
        this.orgCd = orgCd;
    }
}
