package com.nbp.temp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TempController {
	@Autowired
	TempService service;
	
	//온습도 모니터링 결과
	@RequestMapping(value="/temp/list.do")
	public ModelAndView showTemplist(String pageNo) {
		ModelAndView mav = new ModelAndView();
		List<TempDTO> templist = service.findAll(Integer.parseInt(pageNo));
		List<TempDTO> tempListAll = service.findAll();
		mav.addObject("templist",templist);
		mav.addObject("tempListAll",tempListAll);
		mav.setViewName("templist");
		return mav;
	}
	
	@RequestMapping(value="/temp/ajax_last.do", produces="application/json;charset=utf-8")
	public @ResponseBody List<TempDTO> showTemplast() {
		List<TempDTO> lastTemp = service.findlastTemp();
		return lastTemp;
	}
}
