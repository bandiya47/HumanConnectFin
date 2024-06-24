package dc.human.gbnb.humanConnect;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public  class DemoController {

	/**
	 * 루트 URL 요청을 처리합니다.
	 *
	 * @return 문자열 "Hello Boot!!"
	 */
	@ResponseBody
	@RequestMapping("/") 
	public String home(){
		System.out.println("Hello Boot!!");
		return "Hello Boot!!"; 
	}


	/**
	 * "/hello.do" URL 요청을 처리하고 뷰에 메시지를 전달합니다.
	 *
	 * @param model 뷰에 데이터를 전달하기 위한 Model 객체
	 * @return 뷰 이름 "hello"
	 */
	@RequestMapping("/hello.do")
	public String hello(Model model){
		System.out.println("안녕하세요");
		model.addAttribute("message","!!!!!hello.jsp입니다.!");
		return "hello";
	} 
}

