package com.hyunah.box.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.request.SessionScope;

import com.hyunah.box.model.Member;
import com.hyunah.box.model.Movie;
import com.hyunah.box.model.MovieApi;
import com.hyunah.box.scheduler.SchedulerUtil;
import com.hyunah.box.service.HeartService;
import com.hyunah.box.service.MovieService;

@Controller
@RequestMapping("/movie")
public class MovieController {
	private final String path = "movie/";

	@Autowired
	MovieService movieService;

	@Autowired
	HeartService heartService;
	
	
	
	

	@RequestMapping({ "/", "/list" })
	public String list(Model model, @SessionAttribute(name="member", required =false) Member member) {
		//Member member = (Member) session.getAttribute("member");
		String memId="";
		if(member == null) {
			memId="noMem";
		}else {
			memId=member.getId();
		}
		List<Movie> list = movieService.list(memId);
		model.addAttribute("list", list);
		return path + "list";
	}

	// (ajax에서 아이디 받아와서 아이디 중복 검사하듯이 -> 있으면 하트 숫자 빼고, 없으면 하트 숫자 더하기)
	@ResponseBody
	@RequestMapping("/{movieCode}/{id}")
	public String heartMovieCheck(@PathVariable int movieCode, @PathVariable String id) {
		
		  if( heartService.heartMovieCheck(movieCode, id) ) { // 조회했는데 찜한 영화로 없다
			  	return "PLUS"; 
			  }else { // 찜한 영화에 있다
				  return "MINUS"; 
			  }
		  }
	
	//PLUS HEART MOVIE
	@ResponseBody
	@RequestMapping("/PLUS/{movieCode}/{id}")
	public String plusHeartMovie(@PathVariable int movieCode, @PathVariable String id) {
		heartService.plusHeartMovie(movieCode, id);
		return "PLUS";
	}
	
	//MINUS HEART MOVIE
	@ResponseBody
	@RequestMapping("/MINUS/{movieCode}/{id}")
	public String minusHeartMovie(@PathVariable int movieCode, @PathVariable String id) {
		heartService.minusHeartMovie(movieCode, id);
		return "MINUS";
	}
	
	
	
	
	@GetMapping("/api/load/kobis")
	public void getJsonDataFromKobis() throws Exception{
		int addMovieApiMinusDataCnt = movieService.getApiData();
		
	}
	
	
	
	
	
}
