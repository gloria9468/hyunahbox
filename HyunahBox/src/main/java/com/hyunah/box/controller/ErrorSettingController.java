package com.hyunah.box.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class ErrorSettingController {
	
	
	    
	    private static Logger logger = LoggerFactory.getLogger(ErrorSettingController.class);
	    
	    @GetMapping("/404")
	    public String Error404(HttpServletRequest request, Model model) {
	    	logger.info("page error code 404");
	    	pageErrorLog(request);
	        model.addAttribute("code", "404");
	        model.addAttribute("msg", "요청하신 페이지는 존재하지 않습니다.");
	        return "/admin/error";
	    }
	    
	    @GetMapping("/500")
	    public String Error500(HttpServletRequest request, Model model) {
	    	logger.info("page error code 500");
	    	pageErrorLog(request);
	    	model.addAttribute("code", "500");
	        model.addAttribute("msg", "서버에 오류가 발생했습니다.");
	        return "/admin/error";
	    }
	
	    
	    private void pageErrorLog(HttpServletRequest request) {
	    	logger.info("status_code : " + request.getAttribute("javax.servlet.error.status_code"));
	    	
	    }
	

}
