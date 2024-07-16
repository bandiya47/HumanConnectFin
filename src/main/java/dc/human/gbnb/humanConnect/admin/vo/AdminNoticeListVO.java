package dc.human.gbnb.humanConnect.admin.vo;

import org.springframework.stereotype.Component;

@Component("adminNoticeListVO")
public class AdminNoticeListVO {

    private int nNumber;
    private String nType;
    private String nTitle;
    private String uId;
    private String nDate;
    private String nContent;
    private String nAttachPath;
    private String CreatedDate;
    private String CreatedId;
    private String UpdatedDate;
    private String UpdatedId;

    public int getnNumber() {
        return nNumber;
    }

    public void setnNumber(int nNumber) {
        this.nNumber = nNumber;
    }

    public String getnType() {
        return nType;
    }

    public void setnType(String nType) {
        this.nType = nType;
    }

    public String getnTitle() {
        return nTitle;
    }

    public void setnTitle(String nTitle) {
        this.nTitle = nTitle;
    }

    public String getuId() {
        return uId;
    }

    public void setuId(String uId) {
        this.uId = uId;
    }

    public String getnDate() {
        return nDate;
    }

    public void setnDate(String nDate) {
        this.nDate = nDate;
    }

    public String getnContent() {
        return nContent;
    }

    public void setnContent(String nContent) {
        this.nContent = nContent;
    }

    public String getnAttachPath() {
        return nAttachPath;
    }

    public void setnAttachPath(String nAttachPath) {
        this.nAttachPath = nAttachPath;
    }

    public String getCreatedDate() {
        return CreatedDate;
    }

    public void setCreatedDate(String createdDate) {
        CreatedDate = createdDate;
    }

    public String getCreatedId() {
        return CreatedId;
    }

    public void setCreatedId(String createdId) {
        CreatedId = createdId;
    }

    public String getUpdatedDate() {
        return UpdatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        UpdatedDate = updatedDate;
    }

    public String getUpdatedId() {
        return UpdatedId;
    }

    public void setUpdatedId(String updatedId) {
        UpdatedId = updatedId;
    }

    @Override
    public String toString() {
        return "AdminNoticeListVO{" +
                "nNumber=" + nNumber +
                ", nType='" + nType + '\'' +
                ", nTitle='" + nTitle + '\'' +
                ", uId='" + uId + '\'' +
                ", nDate='" + nDate + '\'' +
                ", nContent='" + nContent + '\'' +
                ", nAttachPath='" + nAttachPath + '\'' +
                ", CreatedDate='" + CreatedDate + '\'' +
                ", CreatedId='" + CreatedId + '\'' +
                ", UpdatedDate='" + UpdatedDate + '\'' +
                ", UpdatedId='" + UpdatedId + '\'' +
                '}';
    }
}
