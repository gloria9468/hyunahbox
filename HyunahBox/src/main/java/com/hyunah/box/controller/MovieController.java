package com.hyunah.box.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyunah.box.model.Movie;
import com.hyunah.box.service.MovieService;

@Controller
@RequestMapping("/movie")
public class MovieController {
	private final String path = "movie/";
	
	@Autowired
	MovieService service;
	
	@RequestMapping({"/","/list"})
	public String list(Model model) {
		List<Movie> list = service.list();
		model.addAttribute("list", list);
		return path + "list";
	}
	
	@GetMapping("/add")
	public String add() {
		return path + "add";
	}
	@PostMapping("/add")
	public String add(Movie item) {
		service.add(item);
		return "redirect:list";
	}
	
	@GetMapping("/update/{movieCode}")
	public String update(@PathVariable int movieCode, Model model) {
		Movie item = service.getItem(movieCode);
		model.addAttribute("item", item);
		return path + "update";
	}
	@PostMapping("/update/{movieCode}")
	public String update(@PathVariable int movieCode, Movie item) {
		item.setMovieCode(movieCode);
		service.update(item);
		return "redirect:../list";
	}
	
	@RequestMapping("/delete/{movieCode}")
	public String delete(@PathVariable int movieCode) {
		service.delete(movieCode);
		return "redirect:../list";
	}
}

