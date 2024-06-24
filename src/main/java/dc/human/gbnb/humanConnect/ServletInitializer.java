package dc.human.gbnb.humanConnect;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

public class ServletInitializer extends SpringBootServletInitializer {


	/**
	 * WAR 배포를 위한 Servlet 초기화 설정입니다.
	 *
	 * @param application SpringApplicationBuilder 객체
	 * @return SpringApplicationBuilder 객체를 반환합니다.
	 */
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(HumanConnectApplication.class);
	}

}
