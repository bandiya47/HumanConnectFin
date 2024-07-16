package dc.human.gbnb.humanConnect.center.vo;

public class CenterRecruitListVO {
    private String rNum; // 모집 요강 번호
    private String rTitle; // 모집 요강 제목
    private String rRegiDate; // 모집 요강 등록 날짜
    private String rRegiAmnt; // 모집 요강 신청자수

    // getters and setters
    public String getrNum() {
        return rNum;
    }

    public void setrNum(String rNum) {
        this.rNum = rNum;
    }

    public String getrTitle() {
        return rTitle;
    }

    public void setrTitle(String rTitle) {
        this.rTitle = rTitle;
    }

    public String getrRegiDate() {
        return rRegiDate;
    }

    public void setrRegiDate(String rRegiDate) {
        this.rRegiDate = rRegiDate;
    }

    public String getrRegiAmnt() {
        return rRegiAmnt;
    }

    public void setrRegiAmnt(String rRegiAmnt) {
        this.rRegiAmnt = rRegiAmnt;
    }
}
