package com.hyunah.box.controller;
import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.hyunah.box.menu.service.CommService;
import com.hyunah.box.model.Member;
import com.hyunah.box.model.Menu;
import com.hyunah.box.model.Movie;
import com.hyunah.box.model.Schedule;
import com.hyunah.box.model.ScreenInfo;
import com.hyunah.box.model.Theater;
import com.hyunah.box.model.TimeTable;
import com.hyunah.box.service.MovieService;
import com.hyunah.box.service.ScheduleService;
import com.hyunah.box.service.ScreenInfoService;
import com.hyunah.box.service.SitsInfoServie;
import com.hyunah.box.service.TheaterService;
import com.hyunah.box.service.TimeTableService;
import com.hyunah.box.util.UtilFunc;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private final String movieRM = "/movie";
	private final String screenInfoRM = "/theater/{theaterCode}/screenInfo";
	private final String theaterRM = "/theater";
	private final String scheduleRM = "/schedule";
	
	private final String adminPath = "admin/"; 
	private final String moviePath = "admin/movie/";
	private final String theaterPath = "admin/theater/";
	private final String screenInfoPath = "admin/theater/screenInfo/";
	private final String schedulePath = "admin/schedule/";
	
	@Autowired
	UtilFunc utilFunc;
	
	
	@Autowired
	MovieService movieService;
	
	@Autowired
	TheaterService theaterService;
	
	@Autowired
	ScreenInfoService screenInfoService;
	
	@Autowired
	ScheduleService scheduleService;
	
	@Autowired
	TimeTableService timeTableService;
	
	@Autowired
	ScreenInfoService sService;
	
	@Autowired
	SitsInfoServie sitsService;
	
	@Autowired
	CommService commService;
	 
    @ModelAttribute("adminMiniNav")
    public List<Map<String, String>> adminMiniNav(HttpServletRequest req) {
    	String uri = req.getRequestURI();
    	
    	System.out.println("getRequestURI----" + uri);
        
        List<Map<String, String>> adminMiniNavList = new ArrayList<Map<String,String>> ();
        Map<String, String> map = new HashMap<String, String> ();
        map.put("menuName", "관리자"); 
        map.put("menuSrc", adminPath);
        
        adminMiniNavList.add(map);
        
        return adminMiniNavList;
    }
    
    
    
    
	
	@RequestMapping({"","/", "admin-main"})
	public String adminMain( @SessionAttribute(name = "member", required = false) Member member, Model model ){
		List<Menu> adminMenuList = utilFunc.menuListByRole(member, "admin");
		model.addAttribute("adminMenuList", adminMenuList);
		
		return adminPath + "admin-main.tiles";
	}
	
	@RequestMapping({"menu/list"})
	public String adminMenu( @SessionAttribute(name = "member", required = false) Member member, Model model ){
		List<Menu> adminMenuList = utilFunc.menuListByRole(member, "admin");
		model.addAttribute("adminMenuList", adminMenuList);
		
		return adminPath + "menu/list";
	}
	
	//영화
	@RequestMapping({movieRM + "", movieRM + "/list"})
	public String movieList(@SessionAttribute(name = "member") Member member, @ModelAttribute Movie movie, Model model) {
		movie.setListType("adminList");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member", member);
		map.put("movie", movie);
		
		int movieTotalCnt = movieService.movieTotalCnt(map);
		movie.setTotalCnt(movieTotalCnt);
		/*
		double pu = (double) movieTotalCnt / movie.getCntperpage();
		int moviePageunit = (int) Math.ceil( pu );
		movie.setPageunit(moviePageunit);
		*/
		
		List<Movie> list = movieService.list(map);
		model.addAttribute("movie", movie);
		model.addAttribute("list", list);
		return moviePath + "list";
	}
	
	@GetMapping(movieRM + "/add")
	public String moveiAdd() {
		return moviePath + "add";
	}
	@ResponseBody
	@PostMapping(movieRM + "/add")
	public Map<String, String> movieAdd(Movie item) {
		int addMovie = movieService.add(item);
		String addMovieCode = String.valueOf(item.getMovieCode());
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("url", "/admin" + movieRM + "/update/"+ addMovieCode);
		return map;
	}
	
	@GetMapping(movieRM + "/update/{movieCode}")
	public String movieUpdate(@PathVariable int movieCode, Model model) {
		Movie item = movieService.getItem(movieCode);
		model.addAttribute("item", item);
		return moviePath + "update";
	}
	@ResponseBody
	@PostMapping(movieRM + "/update/{movieCode}")
	public Map<String, String> movieUpdate(@PathVariable int movieCode, Movie item) {
		item.setMovieCode(movieCode);
		movieService.update(item);
		Map<String, String> map = new HashMap<String, String>();
		map.put("url", "/admin" + movieRM + "/update/" + movieCode);
		map.put("msg", "변경되었습니다.");
		return map;
	}
	
	@ResponseBody
	@RequestMapping(movieRM + "/delete/{movieCode}")
	public Map<String, String> movieDelete(@PathVariable int movieCode) {
		movieService.delete(movieCode);
		Map<String, String> map = new HashMap<String, String>();
		map.put("url", "/admin" + movieRM + "/list");
		return map;
	}
	
	
	//극장
	@RequestMapping({theaterRM + "",theaterRM + "/list"})
	public String theaterList(@ModelAttribute Theater theater, Model model) {
		int theaterTotalCnt = theaterService.theaterTotalCnt(theater);
		theater.setTotalCnt(theaterTotalCnt);
		
		List<Theater> list = theaterService.list(); // TODO :: theater 객체 넣어서 
		model.addAttribute("item", theater);
		model.addAttribute("list", list);
		
		System.out.println("theat-=----------");
		
		return theaterPath + "list";
	}
	
	@GetMapping(theaterRM + "/add")
	public String theaterAdd() {
		
		return theaterPath + "add";
	}
	
	@ResponseBody
	@PostMapping(theaterRM + "/add")
	public Map<String, String> theaterAdd(Theater theater) {
		int addTheater = theaterService.add(theater);
		String addTheaterCode = String.valueOf(theater.getTheaterCode());
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("url", "/admin" + theaterRM + "/update/"+ addTheaterCode);
		return map;
	}
	
	@GetMapping(theaterRM + "/update/{theaterCode}")
	public String theaterUpdate(@PathVariable int theaterCode, Model model) {
		Theater item = theaterService.getItem(theaterCode);
		model.addAttribute("item", item);

		return theaterPath + "update";
	}
	
	@ResponseBody
	@PostMapping(theaterRM + "/update/{theaterCode}")
	public Map<String, String> theaterUpdate(@PathVariable int theaterCode, Theater theater) {
		theater.setTheaterCode(theaterCode);
		theaterService.update(theater);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("url", "/admin" + theaterRM + "/update/" + theaterCode);
		map.put("msg", "변경되었습니다.");
		return map;
	}
	
	@ResponseBody
	@RequestMapping(theaterRM + "/delete/{theaterCode}")
	public Map<String, String> theaterDelete(@PathVariable int theaterCode) {
		theaterService.delete(theaterCode);
		Map<String, String> map = new HashMap<String, String>();
		map.put("url", "/admin" + theaterRM + "/list");
		return map;
	}
	
	
	//상영관
	@RequestMapping({screenInfoRM + "/", screenInfoRM + "/list"})
	public String screenInfoList(@PathVariable int theaterCode, Model model) {
		List<ScreenInfo> screenInfoList = screenInfoService.list(theaterCode);
		model.addAttribute("screenInfoList", screenInfoList);

		return screenInfoPath + "list";
	}
	@GetMapping(screenInfoRM + "/add")
	public String screenInfoAdd() {
		return screenInfoPath + "add";
	}
	
	@Transactional
	@PostMapping(screenInfoRM + "/add")
	public String screenInfoAdd(@PathVariable int theaterCode , ScreenInfo screen){
		screen.setTheaterCode(theaterCode);
		sService.add(screen);
		sitsService.add(screen.getSitTotal(), screen.getScreenCode());
		
		return "redirect:list";
	}
	@GetMapping(screenInfoRM + "/update/{screenCode}")
	public String screenInfoUpdate(@PathVariable int theaterCode, @PathVariable int screenCode, Model model) {
		 ScreenInfo screen = screenInfoService.getItem(theaterCode, screenCode);
		
		model.addAttribute("screen", screen);
		return screenInfoPath + "update";
	}
	@PostMapping(screenInfoRM + "/update/{screenCode}")
	public String screenInfoUpdate(@PathVariable int theaterCode, @PathVariable int screenCode, ScreenInfo screen) {
		screen.setTheaterCode(theaterCode);
		screenInfoService.update(screen);
		return "redirect:../list";
	}
	
	@Transactional
	@RequestMapping(screenInfoRM + "/delete/{screenCode}")
	public String screenInfoDelete(@PathVariable int theaterCode, @PathVariable int screenCode) {
		sitsService.delete(screenCode);
		screenInfoService.delete(theaterCode, screenCode);
		
		return "redirect:../list";
	}
	
	
	@GetMapping(screenInfoRM + "/{screenCode}/timeTable")
	public String addTime(@PathVariable int screenCode, Model model) {
		List<TimeTable> timeTable = timeTableService.timeList(screenCode);
		model.addAttribute("timeTable", timeTable);
		

		return screenInfoPath + "timeTable";
	}
	
	
	//스케쥴
	@RequestMapping({scheduleRM, scheduleRM + "/", scheduleRM + "/list"})
	public String list(Model model) {
		List<Schedule> scheduleList = scheduleService.list(); 
		model.addAttribute("scheduleList", scheduleList);
		
		return schedulePath + "list";
	}
	@GetMapping(scheduleRM + "/add")
	public String add(Model movieModel, Model theaterModel) { //어느 영화관에서, 어떤 영화를, 몇시에.
		List<Movie> movieList = movieService.list("noMem", "list");
		movieModel.addAttribute("movieList", movieList);
		
		List<Theater> theaterList = theaterService.list();
		theaterModel.addAttribute("theaterList", theaterList);
		
		return schedulePath + "add";
	}
	
	@ResponseBody
	@PostMapping(scheduleRM + "/add/{theaterCode}/screenList")
	public HashMap<String, Object> screenList(@PathVariable int theaterCode, @RequestBody ScreenInfo screeninfo) {
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("list", screenInfoService.screenList(theaterCode) );
		
		System.out.println(map);
		
		return map;
	}
	
	@ResponseBody
	@PostMapping(scheduleRM + "/add/{screenCode}/timeList")
	public List<TimeTable> timeList(@PathVariable int screenCode) {
		List<TimeTable> timeTable = timeTableService.timeList(screenCode);
		
		return timeTable;
	} 
	
	
	
	@Transactional
	@PostMapping(scheduleRM + "/add")
	public String add(Schedule item) {
		String scheduleCodeSeq = Integer.toString( commService.getNextval("schedule_code_seq") );
		item.setScheduleCode( scheduleCodeSeq );
		
		scheduleService.add(item);
		timeTableService.add( item.getTimeTableDate() , item.getScreenCode(), item.getScheduleCode() );
		System.out.println(item);
		
		
		return "redirect:list";
	}
	
	@RequestMapping(scheduleRM + "/delete/{scheduleCode}")
	public String delete(@PathVariable String scheduleCode) {
		scheduleService.delete(scheduleCode);
		
		return "redirect:../list";
	}
	
	// TODO 스케쥴 업데이트 페이지 만들기
	
	
	@GetMapping("/menu")
	public String adminMenu() {
		
		return "";
	}
	
	// api 데이터 수동 실행
	@GetMapping("/getMovieApiData")
	public String getApiData() throws Exception{
		int addMovieApiMinusDataCnt = movieService.getApiData();
		
		return "/admin/movie/apiDataResult";
	}
	
	
}
