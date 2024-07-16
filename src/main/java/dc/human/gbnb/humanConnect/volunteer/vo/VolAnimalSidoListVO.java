package dc.human.gbnb.humanConnect.volunteer.vo;

public class VolAnimalSidoListVO {
    private String code;
    private String name;

    // 기본 생성자
    public VolAnimalSidoListVO() {}

    // 매개 변수를 받는 생성자
    public VolAnimalSidoListVO(String code, String name) {
        this.code = code;
        this.name = name;
    }

    // Getters and setters

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
