package dc.human.gbnb.humanConnect;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("dc.human.gbnb.humanConnect.**.dao")
public class HumanConnectApplication {


	/**
	 * HumanConnectApplication의 진입점입니다.
	 * Spring Boot 애플리케이션을 시작합니다.
	 *
	 * @param args 커맨드 라인 인자를 포함한 배열
	 */
	public static void main(String[] args) {
		SpringApplication.run(HumanConnectApplication.class, args);
	}

}

