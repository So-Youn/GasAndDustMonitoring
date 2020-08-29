package com.nbp.co;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CoController {
	@Autowired
	CoService service;
	
	//온습도 모니터링 결과
	@RequestMapping(value="/co/list.do")
	public ModelAndView showTemplist(String pageNo) {
		ModelAndView mav = new ModelAndView();
		//페이징
		List<CoDTO> colist = service.findAll(Integer.parseInt(pageNo));
		//co2
		List<Co2DTO> co2list = service.findAllCo2();
		//Line 그래프
		List<CoDTO> coListAll = service.findAll();
		mav.addObject("colist", colist);
		mav.addObject("coListAll",coListAll);
		mav.addObject("co2list",co2list);
		mav.setViewName("colist");
		return mav;
	}
	
	@RequestMapping(value="/co/ajax_last.do", produces="application/json;charset=utf-8")
	public @ResponseBody List<CoDTO> showColast(){
		List<CoDTO> lastCo = service.findlastCo();
		return lastCo;
	}
}
