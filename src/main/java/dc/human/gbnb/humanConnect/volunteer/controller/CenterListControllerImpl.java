package dc.human.gbnb.humanConnect.volunteer.controller;

import dc.human.gbnb.humanConnect.volunteer.service.CenterListService;
import dc.human.gbnb.humanConnect.volunteer.service.VolunteerDetailService;
import dc.human.gbnb.humanConnect.volunteer.vo.CenterListVO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolunteerDetailVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;



@Controller("centerListController")
public class CenterListControllerImpl implements CenterListController {
	@Autowired
	private CenterListService centerListService;

	@Autowired
	private CenterListVO centerListVO ;

	@Autowired
	private VolunteerDetailService volunteerDetailService;

	@Autowired
	private VolunteerDetailVO volunteerDetailVO ;

	private static final String CURR_IMAGE_REPO_PATH = "c:\\spring\\upload_volunteer";

	@Override
	@RequestMapping(value= "/viewCenterList.do", method = RequestMethod.GET)
	public ModelAndView viewCenterList(HttpServletRequest request, HttpServletResponse response,
											@RequestParam("userId") String userId) throws Exception {


		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1543061/animalShelterSrvc/shelterInfo"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=FLy6xC7nTacvM663y4Qv%2FbhAlCm9OwG9K1xBr793iGIAQu24Z625CHW0C5c5dhZL%2Bna1qTW0TIBM8GhIzYzxLw%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("care_reg_no", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*보호센터등록번호*/
		urlBuilder.append("&" + URLEncoder.encode("care_nm", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*동물보호센터명*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수 (1,000 이하)*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*xml(기본값) 또는 json*/
		URL url = new URL(urlBuilder.toString());

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}

		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		List<Map<String, String>> careInfo = new ArrayList<>();

		// 정규 표현식 패턴 준비
		String careNmPattern = "<careNm>(.*?)</careNm>";
		String careAddrPattern = "<careAddr>(.*?)</careAddr>";
		String 	careTelPattern = "<careTel>(.*?)</careTel>";
		Pattern careNmMatcher = Pattern.compile(careNmPattern);
		Pattern careAddrMatcher = Pattern.compile(careAddrPattern);
		Pattern careTelMatcher = Pattern.compile(careTelPattern);

		// matcher 생성 및 반복 시작
		Matcher careNmFinder = careNmMatcher.matcher(sb);
		Matcher careAddrFinder = careAddrMatcher.matcher(sb);
		Matcher careTelFinder = careTelMatcher.matcher(sb);

		int careNmIndex = 0;
		while (careNmFinder.find()) {
			String careNmContent = careNmFinder.group(1);

			// 주소 일치 여부 확인 및 추출
			if (careAddrFinder.find()) {
				String careAddrContent = careAddrFinder.group(1);

				if (careTelFinder.find()) {
					String careTelContent = careTelFinder.group(1);

					// Map에 정보 저장
					Map<String, String> careInfoMap = new HashMap<>();
					careInfoMap.put("careNm", careNmContent);
					careInfoMap.put("careAddr", careAddrContent);
					careInfoMap.put("careTel", careTelContent);
					careInfo.add(careNmIndex, careInfoMap); // 동일 인덱스에 저장

					careNmIndex++; // 인덱스 증가
				}
			}
		}

		System.out.println(careInfo.get(4).get("careNm"));
		System.out.println(careInfo.get(4).get("careAddr"));
		System.out.println(careInfo.get(4).get("careTel"));


		ModelAndView mav = new ModelAndView("centerList");
		mav.addObject("careInfo",careInfo);
		mav.addObject("userId",userId);
		return mav;
	}



	@Override
	@RequestMapping(value= "/detailCenterList.do", method = RequestMethod.GET)
	public ModelAndView detailCenterList(HttpServletRequest request, HttpServletResponse response,
									     @RequestParam("userId") String userId,
										 @RequestParam("careNm") String careNm) throws Exception {


		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1543061/animalShelterSrvc/shelterInfo"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=FLy6xC7nTacvM663y4Qv%2FbhAlCm9OwG9K1xBr793iGIAQu24Z625CHW0C5c5dhZL%2Bna1qTW0TIBM8GhIzYzxLw%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("care_reg_no", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*보호센터등록번호*/
		urlBuilder.append("&" + URLEncoder.encode("care_nm", "UTF-8") + "=" + URLEncoder.encode(careNm, "UTF-8")); /*동물보호센터명*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*한 페이지 결과 수 (1,000 이하)*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*xml(기본값) 또는 json*/
		URL url = new URL(urlBuilder.toString());

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}

		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		List<Map<String, String>> careInfo = new ArrayList<>();

		// 정규 표현식 패턴 준비
		String careNmPattern = "<careNm>(.*?)</careNm>";
		String careAddrPattern = "<careAddr>(.*?)</careAddr>";
		String careTelPattern = "<careTel>(.*?)</careTel>";
		String saveTrgtAnimalPattern = "<saveTrgtAnimal>(.*?)</saveTrgtAnimal>";

		Pattern careNmMatcher = Pattern.compile(careNmPattern);
		Pattern careAddrMatcher = Pattern.compile(careAddrPattern);
		Pattern careTelMatcher = Pattern.compile(careTelPattern);
		Pattern saveTrgtAnimalMatcher = Pattern.compile(saveTrgtAnimalPattern);

		// matcher 생성 및 반복 시작
		Matcher careNmFinder = careNmMatcher.matcher(sb);
		Matcher careAddrFinder = careAddrMatcher.matcher(sb);
		Matcher careTelFinder = careTelMatcher.matcher(sb);
		Matcher saveTrgtAnimalFinder = saveTrgtAnimalMatcher.matcher(sb);

		int careNmIndex = 0;
		while (careNmFinder.find()) {
			String careNmContent = careNmFinder.group(1);

			// 주소 일치 여부 확인 및 추출
			if (careAddrFinder.find()) {
				String careAddrContent = careAddrFinder.group(1);

				if (careTelFinder.find()) {
					String careTelContent = careTelFinder.group(1);

					if (saveTrgtAnimalFinder.find()) {
						String saveTrgtAnimalContent = saveTrgtAnimalFinder.group(1);

						// Map에 정보 저장
						Map<String, String> careInfoMap = new HashMap<>();
						careInfoMap.put("careNm", careNmContent);
						careInfoMap.put("careAddr", careAddrContent);
						careInfoMap.put("careTel", careTelContent);
						careInfoMap.put("saveTrgtAnimal", saveTrgtAnimalContent);
						careInfo.add(careNmIndex, careInfoMap); // 동일 인덱스에 저장

						careNmIndex++; // 인덱스 증가
					}
				}
			}
		}

		System.out.println(careInfo.get(0).get("careNm"));
		System.out.println(careInfo.get(0).get("careAddr"));
		System.out.println(careInfo.get(0).get("careTel"));
		System.out.println(careInfo.get(0).get("saveTrgtAnimal"));

		int disable=0;
		disable =centerListService.selectNmCenterList(careInfo.get(0).get("careNm"));

		ModelAndView mav = new ModelAndView("centerDetail");
		mav.addObject("disable",disable);
		mav.addObject("careInfo",careInfo);
		mav.addObject("userId",userId);
		return mav;
	}


	@Override
	@RequestMapping(value= "/adoptCenterList.do", method = RequestMethod.POST)
	public ModelAndView adoptCenterList(HttpServletRequest request, HttpServletResponse response,
										@ModelAttribute("centerList") CenterListVO centerList,
										 @RequestParam("userId") String userId) throws Exception {
		int insert = 0;
		insert = centerListService.addAdoptCenterList(centerList);



		ModelAndView mav = new ModelAndView("redirect:/viewCenterList.do");
		mav.addObject("userId",userId);
		return mav;
	}

	@Override
	@RequestMapping(value= "/addAccount.do", method = RequestMethod.GET)
	public ModelAndView addAccount(HttpServletRequest request, HttpServletResponse response) throws Exception {

		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1543061/animalShelterSrvc/shelterInfo"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=FLy6xC7nTacvM663y4Qv%2FbhAlCm9OwG9K1xBr793iGIAQu24Z625CHW0C5c5dhZL%2Bna1qTW0TIBM8GhIzYzxLw%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("care_reg_no", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*보호센터등록번호*/
		urlBuilder.append("&" + URLEncoder.encode("care_nm", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*동물보호센터명*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수 (1,000 이하)*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*xml(기본값) 또는 json*/
		URL url = new URL(urlBuilder.toString());

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}

		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		List<Map<String, String>> careInfo = new ArrayList<>();

		// 정규 표현식 패턴 준비
		String careNmPattern = "<careNm>(.*?)</careNm>";
		String careAddrPattern = "<careAddr>(.*?)</careAddr>";
		String careTelPattern = "<careTel>(.*?)</careTel>";
		String saveTrgtAnimalPattern = "<saveTrgtAnimal>(.*?)</saveTrgtAnimal>";

		Pattern careNmMatcher = Pattern.compile(careNmPattern);
		Pattern careAddrMatcher = Pattern.compile(careAddrPattern);
		Pattern careTelMatcher = Pattern.compile(careTelPattern);
		Pattern saveTrgtAnimalMatcher = Pattern.compile(saveTrgtAnimalPattern);

		// matcher 생성 및 반복 시작
		Matcher careNmFinder = careNmMatcher.matcher(sb);
		Matcher careAddrFinder = careAddrMatcher.matcher(sb);
		Matcher careTelFinder = careTelMatcher.matcher(sb);
		Matcher saveTrgtAnimalFinder = saveTrgtAnimalMatcher.matcher(sb);

		int careNmIndex = 0;
		while (careNmFinder.find()) {
			String careNmContent = careNmFinder.group(1);

			// 주소 일치 여부 확인 및 추출
			if (careAddrFinder.find()) {
				String careAddrContent = careAddrFinder.group(1);

				if (careTelFinder.find()) {
					String careTelContent = careTelFinder.group(1);

					if (saveTrgtAnimalFinder.find()) {
						String saveTrgtAnimalContent = saveTrgtAnimalFinder.group(1);

						// Map에 정보 저장
						Map<String, String> careInfoMap = new HashMap<>();
						careInfoMap.put("careNm", careNmContent);
						careInfoMap.put("careAddr", careAddrContent);
						careInfoMap.put("careTel", careTelContent);
						careInfoMap.put("saveTrgtAnimal", saveTrgtAnimalContent);
						careInfo.add(careNmIndex, careInfoMap); // 동일 인덱스에 저장

						careNmIndex++; // 인덱스 증가
					}
				}
			}
		}
		for(int i=0; i<careInfo.size();i++ ){

			centerListVO.setC_id(i);
			centerListVO.setC_name(careInfo.get(i).get("careNm"));
			centerListVO.setC_addr1(careInfo.get(i).get("careAddr"));
			centerListVO.setC_phone(careInfo.get(i).get("careTel"));
			int insert = 0;
			insert = centerListService.addCenterList(centerListVO);
		}

		System.out.println(careInfo.get(0).get("careNm"));
		System.out.println(careInfo.get(0).get("careAddr"));
		System.out.println(careInfo.get(0).get("careTel"));
		System.out.println(careInfo.get(0).get("saveTrgtAnimal"));

		ModelAndView mav = new ModelAndView("");

		return mav;
	}


	@Override
	@RequestMapping(value= "/volCenterList.do", method = RequestMethod.POST)
	public ModelAndView volCenterList(HttpServletRequest request, HttpServletResponse response,
										 @RequestParam("userId") String userId,
										 @RequestParam("careNm") String careNm) throws Exception {




		List<VolunteerDetailVO> careInfo = centerListService.listvolCenterList(careNm);
		String job ="Regist";
		ModelAndView mav = new ModelAndView("volCenterList");
		mav.addObject("job",job);
		mav.addObject("careInfo",careInfo);
		mav.addObject("userId",userId);
		return mav;
	}


	@Override
	@RequestMapping(value= "/insertVolCenterList.do", method = RequestMethod.POST)
	public ModelAndView insertVolCenterList(@ModelAttribute("volunteerDetail") VolunteerDetailVO volunteerDetail,
											  HttpServletRequest request, HttpServletResponse response,
											  @RequestParam("userId") String userId) throws Exception {


		int insert = 0;
		insert = volunteerDetailService.addVolunteerDetail(volunteerDetail);
		int vReg_no = volunteerDetailService.v_noVolunteerDetail();
		volunteerDetail.setvReg_no(vReg_no);
		insert = volunteerDetailService.addVolunteerDetail2(volunteerDetail);
		List<VolunteerDetailVO> Result = volunteerDetailService.listRegVolunteerDetail2(vReg_no);
		System.out.println(Result.get(0).getvInfo());
		ModelAndView mav = new ModelAndView("/volCenterList");

		String job="ViewReg";
		int userType =1;
		mav.addObject("job",job);
		mav.addObject("userType",userType);
		mav.addObject("volunteerList",Result);
		mav.addObject("userId", userId);
		return mav;
	}

	@Override
	@RequestMapping(value= "/modVolCenterList.do", method = RequestMethod.POST)
	public ModelAndView modVolCenterList(HttpServletRequest request, HttpServletResponse response,
										   @RequestParam("userId") String userId,
										   @RequestParam("vReg_no") int vReg_no) throws Exception {

		List<VolunteerDetailVO> Result = volunteerDetailService.listRegVolunteerDetail2(vReg_no);
		ModelAndView mav = new ModelAndView("/volCenterList");



		String job="Modify";
		int userType =1;
		mav.addObject("job",job);
		mav.addObject("userType",userType);
		mav.addObject("volunteerList",Result);
		mav.addObject("userId", userId);
		return mav;
	}



	}
