package com.hyunah.box.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyunah.box.model.Movie;
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
	
	@RequestMapping({"/","/list"})
	public String list(Model model) {
		List<Movie> list = movieService.list();
		model.addAttribute("list", list);
		return path + "list";
	}
	
	
	// TODO 하트 숫자 올리기 
	//(ajax에서 아이디 받아와서 아이디 중복 검사하듯이 -> 있으면 하트 숫자 빼고, 없으면 하트 숫자 더하기) 
	@ResponseBody
	@GetMapping("/{movieCode}/{id}")
	public String heartMovieCheck(@PathVariable int movieCode, @PathVariable String id) {
		if( heartService.heartMovieCheck(movieCode, id) ) { // 조회했는데 찜한 영화로 있다
			return "MINUS";
		}else { // 찜한 영화에 없다.
			return "PLUS";
		}
		
	}
}

