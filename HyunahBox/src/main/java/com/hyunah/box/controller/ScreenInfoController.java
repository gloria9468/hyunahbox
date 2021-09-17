package com.hyunah.box.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyunah.box.model.ScreenInfo;
import com.hyunah.box.service.ScreenInfoService;

@Controller
@RequestMapping("/theater/{theaterCode}/screenInfo")
public class ScreenInfoController {
	private final String sPath = "theater/screenInfo/";

	@Autowired
	ScreenInfoService sService;

	
	@RequestMapping({"","/", "/list"})
	public String screenInfoList(@PathVariable int theaterCode, Model model) {
		List<ScreenInfo> screenInfoList = sService.list(theaterCode);
		model.addAttribute("screenInfoList", screenInfoList);

		return sPath + "list";
	}
	@GetMapping("/add")
	public String screenInfoAdd() {
		return sPath + "add";
	}
	@PostMapping("/add")
	public String screenInfoAdd(@PathVariable int theaterCode , ScreenInfo screen){
		screen.setTheaterCode(theaterCode);
		sService.add(screen);
		return "redirect:list";
	}
	@GetMapping("/update/{screenCode}")
	public String screenInfoUpdate(@PathVariable int theaterCode, @PathVariable int screenCode, Model model) {
		 ScreenInfo screen = sService.getItem(theaterCode, screenCode);
		
		model.addAttribute("screen", screen);
		return sPath + "update";
	}
	@PostMapping("/update/{screenCode}")
	public String screenInfoUpdate(@PathVariable int theaterCode, @PathVariable int screenCode, ScreenInfo screen) {
		screen.setTheaterCode(theaterCode);
		sService.update(screen);
		return "redirect:../list";
	}
	
	@RequestMapping("/delete/{screenCode}")
	public String screenInfoDelete(@PathVariable int theaterCode, @PathVariable int screenCode) {
		sService.delete(theaterCode, screenCode);
		
		return "redirect:../list";
	}
	
}

// TODO timetable 추가 해줘야함.