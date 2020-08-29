package com.nbp.gas;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.XML;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MainController {
	@Autowired
	GasService service;

	@RequestMapping(value = "/dash.do")
	public String dash() {
		return "dash";
	}
	// 메인화면 + 미세먼지 API 
	@RequestMapping(value = "/dashboard.do", method = RequestMethod.GET)
	public @ResponseBody ModelAndView dashboard() {
		ModelAndView mav = new ModelAndView();
		StringBuilder urlBuilder = new StringBuilder(
				"http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty");
		String serviceKey = "lZ6%2BCTtFnOwqxxqyLHJY8xrYgbsYps3i4OIKBkY9Drj48PLtW0SODOdjwLXmkKuk8RmixdcUFPyg7CTp28qNRA%3D%3D";
		try {

			urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + serviceKey);
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
					+ URLEncoder.encode("1", "UTF-8")); /* 한 페이지 결과 수 */
			urlBuilder.append(
					"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("2", "UTF-8")); /* 페이지 번호 */
			urlBuilder.append("&" + URLEncoder.encode("stationName", "UTF-8") + "="
					+ URLEncoder.encode("석사동", "UTF-8")); /* 측정소 이름 */
			urlBuilder.append("&" + URLEncoder.encode("dataTerm", "UTF-8") + "="
					+ URLEncoder.encode("DAILY", "UTF-8")); /* 요청 데이터기간 (하루 : DAILY, 한달 : MONTH, 3달 : 3MONTH) */
			urlBuilder.append("&" + URLEncoder.encode("ver", "UTF-8") + "="
					+ URLEncoder.encode("1.3", "UTF-8")); /* 버전별 상세 결과 참고문서 참조 */
			urlBuilder.append("&" + URLEncoder.encode("dataType", "UTF-8") + "="
					+ URLEncoder.encode("JSON", "UTF-8")); /* 버전별 상세 결과 참고문서 참조 */

			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "text/html");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			String line = "";
			String result = "";
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			while((line = rd.readLine())!=null) {
				result = result.concat(line).concat("\n");
				
			}
			//XML -> JSON으로 변환하기
			org.json.JSONObject xmlJsobObject = XML.toJSONObject(result.toString());
			
			String jsonPrettyPrintString  = xmlJsobObject.toString();
			//파싱하기

			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(jsonPrettyPrintString); 
			JSONObject parse_response = (JSONObject) obj.get("response");
			JSONObject parse_body = (JSONObject) parse_response.get("body");
			JSONObject parse_items = (JSONObject) parse_body.get("items");
			JSONObject parse_item = (JSONObject) parse_items.get("item");
			System.out.println("미세먼지 데이터 조회\n"+parse_item);	
			rd.close();
			conn.disconnect();
			mav.addObject("parse_item",parse_item);
			mav.setViewName("dashboard");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return mav;
	}

	// 오존 측정
	@RequestMapping(value = "/o3/list.do")
	public ModelAndView showO3(String pageNo) {
		ModelAndView mav = new ModelAndView();
		List<OzoneDTO> o3List = service.findAll(Integer.parseInt(pageNo));
		List<OzoneDTO> o3ListAll = service.findAll();
		mav.addObject("o3List", o3List);
		mav.addObject("o3ListAll", o3ListAll);
		mav.setViewName("o3list");
		return mav;
	}

	@RequestMapping(value = "/o3/ajax_last.do", produces = "application/json;charset=utf-8")
	public @ResponseBody List<OzoneDTO> showO3last() {
		List<OzoneDTO> lastO3 = service.findlastO3();
		return lastO3;
	}

	@RequestMapping(value = "/cautious/list.do")
	public ModelAndView showCautious(String pageNo) {
		ModelAndView mav = new ModelAndView();
		List<No2DTO> No2list = service.findNo2list(Integer.parseInt(pageNo));
		List<No2DTO> No2listAll = service.findNo2All();
		List<NH3DTO> Nh3listAll = service.findNh3All();
		mav.addObject("No2list", No2list);
		mav.addObject("No2listAll", No2listAll);
		mav.addObject("Nh3listAll", Nh3listAll);
		mav.setViewName("cautiouslist");
		return mav;

	}

	@RequestMapping(value = "/cautious/ajax_last.do", produces = "application/json;charset=utf-8")
	public @ResponseBody List<No2DTO> showNo2last(HttpServletResponse response) throws Exception {
		List<No2DTO> lastNo2 = service.findlastNo2();
		return lastNo2;
	}

}
