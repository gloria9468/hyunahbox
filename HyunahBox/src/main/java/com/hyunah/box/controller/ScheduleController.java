package com.hyunah.box.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyunah.box.model.Movie;
import com.hyunah.box.model.Schedule;
import com.hyunah.box.model.ScreenInfo;
import com.hyunah.box.model.Theater;
import com.hyunah.box.model.TimeTable;
import com.hyunah.box.service.MovieService;
import com.hyunah.box.service.ScheduleService;
import com.hyunah.box.service.ScreenInfoService;
import com.hyunah.box.service.TheaterService;
import com.hyunah.box.service.TimeTableService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	private final String path = "schedule/"; 
	
	@Autowired
	TheaterService tService;
	
	@Autowired
	MovieService mService;
	
	@Autowired
	ScreenInfoService screenService;
	
	@Autowired
	ScheduleService sService;
	
	@Autowired
	TimeTableService timeService;
	

	@RequestMapping({"/", "/list"})
	public String list(Model model) {
		List<Schedule> scheduleList = sService.list(); 
		model.addAttribute("scheduleList", scheduleList);
		
		return path + "list";
	}
	@GetMapping("/add")
	public String add(Model movieModel, Model theaterModel) { //어느 영화관에서, 어떤 영화를, 몇시에.
		List<Movie> movieList = mService.list();
		movieModel.addAttribute("movieList", movieList);
		
		List<Theater> theaterList = tService.list();
		theaterModel.addAttribute("theaterList", theaterList);
		
		return path + "add";
		
		
	// TODO 일단 상영관을 누르면 그 상영관의 해당 날짜에 따른 스케쥴이 표 형태로 보일 수 있게.
	}
	
//	@ResponseBody
//	@PostMapping("/add/screenList")
//	public List<ScreenInfo> screenList(HttpServletRequest req) {
//		String theater = req.getParameter("theaterCode");
//		System.out.println("theater ---->>>>>" + theater);
//		int theaterCode = Integer.parseInt(theater);
//		
//		
//		List<ScreenInfo> screenInfoList = screenService.list(theaterCode);
//		System.out.println(theater);
//		System.out.println(screenInfoList);
//		return screenInfoList;
//		
//	}
	
	@ResponseBody
	@PostMapping("/add/{theaterCode}/screenList")
	public HashMap<String, Object> screenList(@PathVariable int theaterCode, @RequestBody ScreenInfo screeninfo) {
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("list", screenService.screenList(theaterCode) );
		
		System.out.println(map);
		
		return map;
	}
	
	@ResponseBody
	@PostMapping("/add/{screenCode}/timeList")
	public List<TimeTable> timeList(@PathVariable int screenCode) {
		List<TimeTable> timeTable = timeService.timeList(screenCode);
		
		return timeTable;
	} 
	
	
	
	@Transactional
	@PostMapping("/add")
	public String add(Schedule item) {
		sService.add(item);
		timeService.add( item.getTimeTableDate() , item.getScreenCode(), item.getScheduleCode() );
		System.out.println(item);
		
		
		return "redirect:list";
	}
	
	@RequestMapping("/delete/{scheduleCode}")
	public String delete(@PathVariable String scheduleCode) {
		sService.delete(scheduleCode);
		
		return "redirect:../list";
	}

// TODO 갑자기 add가 400 이 뜸.	
	
}
