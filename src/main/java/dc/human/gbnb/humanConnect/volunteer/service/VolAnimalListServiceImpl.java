package dc.human.gbnb.humanConnect.volunteer.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import dc.human.gbnb.humanConnect.volunteer.vo.VolAnimalListVO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolAnimalSidoListVO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolAnimalSigunguListVO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolAnimalKindListVO;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class VolAnimalListServiceImpl implements VolAnimalListService {

    @Value("${api.serviceKey}")
    private String serviceKey;

    @Override
    public List<VolAnimalListVO> getAnimalList(int numOfRows, int pageNo, String uprCd, String orgCd, String kindCd) {
        try {
            String urlStr = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?"
                    + "numOfRows=" + numOfRows
                    + "&pageNo=" + pageNo
                    + "&upr_cd=" + uprCd
                    + "&org_cd=" + orgCd
                    + "&kind_cd=" + kindCd
                    + "&_type=json"
                    + "&serviceKey=" + serviceKey;

            URL url = new URL(urlStr);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
            String inputLine;
            StringBuilder content = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                content.append(inputLine);
            }

            in.close();
            conn.disconnect();

            ObjectMapper objectMapper = new ObjectMapper();
            Map<String, Object> response = objectMapper.readValue(content.toString(), Map.class);
            Map<String, Object> responseBody = (Map<String, Object>) response.get("response");
            Map<String, Object> body = (Map<String, Object>) responseBody.get("body");
            Map<String, Object> items = (Map<String, Object>) body.get("items");
            List<Map<String, Object>> itemList = (List<Map<String, Object>>) items.get("item");

            List<VolAnimalListVO> animalList = new ArrayList<>();
            for (Map<String, Object> item : itemList) {
                VolAnimalListVO animal = new VolAnimalListVO(
                        (String) item.get("desertionNo"),
                        (String) item.get("kindCd"),
                        (String) item.get("sexCd"),
                        (String) item.get("careAddr"),
                        (String) item.get("popfile"),
                        (String) item.get("colorCd"),
                        (String) item.get("uprCd"),
                        (String) item.get("orgCd")
                );
                animalList.add(animal);
            }
            return animalList;
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    @Override
    public int getTotalCount(String uprCd, String orgCd, String kindCd) {
        try {
            String urlStr = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?"
                    + "numOfRows=1&pageNo=1&_type=json&serviceKey=" + serviceKey
                    + "&upr_cd=" + uprCd + "&org_cd=" + orgCd + "&kind_cd=" + kindCd;

            URL url = new URL(urlStr);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
            String inputLine;
            StringBuilder content = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                content.append(inputLine);
            }

            in.close();
            conn.disconnect();

            ObjectMapper objectMapper = new ObjectMapper();
            Map<String, Object> response = objectMapper.readValue(content.toString(), Map.class);
            Map<String, Object> body = (Map<String, Object>) ((Map<String, Object>) response.get("response")).get("body");
            return (int) body.get("totalCount");

        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public List<VolAnimalSidoListVO> getSidoList() {
        try {
            String urlStr = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/sido?"
                    + "numOfRows=20&pageNo=1&_type=json&serviceKey=" + serviceKey;

            URL url = new URL(urlStr);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
            String inputLine;
            StringBuilder content = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                content.append(inputLine);
            }

            in.close();
            conn.disconnect();

            ObjectMapper objectMapper = new ObjectMapper();
            Map<String, Object> response = objectMapper.readValue(content.toString(), Map.class);
            Map<String, Object> responseBody = (Map<String, Object>) response.get("response");
            Map<String, Object> body = (Map<String, Object>) responseBody.get("body");
            Map<String, Object> items = (Map<String, Object>) body.get("items");
            List<Map<String, Object>> itemList = (List<Map<String, Object>>) items.get("item");

            List<VolAnimalSidoListVO> sidoList = new ArrayList<>();
            for (Map<String, Object> item : itemList) {
                VolAnimalSidoListVO sido = new VolAnimalSidoListVO(
                        (String) item.get("orgCd"),
                        (String) item.get("orgdownNm")
                );
                sidoList.add(sido);
            }
            return sidoList;
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    @Override
    public List<VolAnimalSigunguListVO> getSigunguList(String uprCd) {
        try {
            String urlStr = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/sigungu?"
                    + "upr_cd=" + uprCd
                    + "&serviceKey=" + serviceKey
                    + "&_type=json";

            URL url = new URL(urlStr);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(),StandardCharsets.UTF_8));
            String inputLine;
            StringBuilder content = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                content.append(inputLine);
            }

            in.close();
            conn.disconnect();

            ObjectMapper objectMapper = new ObjectMapper();
            Map<String, Object> response = objectMapper.readValue(content.toString(), Map.class);
            Map<String, Object> responseBody = (Map<String, Object>) response.get("response");
            Map<String, Object> body = (Map<String, Object>) responseBody.get("body");
            Map<String, Object> items = (Map<String, Object>) body.get("items");
            List<Map<String, Object>> itemList = (List<Map<String, Object>>) items.get("item");

            List<VolAnimalSigunguListVO> sigunguList = new ArrayList<>();
            for (Map<String, Object> item : itemList) {
                VolAnimalSigunguListVO sigungu = new VolAnimalSigunguListVO(
                        (String) item.get("orgCd"),
                        (String) item.get("orgdownNm")
                );
                sigunguList.add(sigungu);
            }
            return sigunguList;
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    @Override
    public List<VolAnimalKindListVO> getKindList(String uprCd) {
        try {
            String urlStr = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/kind?"
                    + "upr_cd=" + uprCd
                    + "&serviceKey=" + serviceKey
                    + "&_type=json";

            URL url = new URL(urlStr);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(),StandardCharsets.UTF_8));
            String inputLine;
            StringBuilder content = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                content.append(inputLine);
            }

            in.close();
            conn.disconnect();

            ObjectMapper objectMapper = new ObjectMapper();
            Map<String, Object> response = objectMapper.readValue(content.toString(), Map.class);
            Map<String, Object> responseBody = (Map<String, Object>) response.get("response");
            Map<String, Object> body = (Map<String, Object>) responseBody.get("body");
            Map<String, Object> items = (Map<String, Object>) body.get("items");
            List<Map<String, Object>> itemList = (List<Map<String, Object>>) items.get("item");

            List<VolAnimalKindListVO> kindList = new ArrayList<>();
            for (Map<String, Object> item : itemList) {
                VolAnimalKindListVO kind = new VolAnimalKindListVO(
                        (String) item.get("kindCd"),
                        (String) item.get("kindNm")
                );
                kindList.add(kind);
            }
            return kindList;
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
}
