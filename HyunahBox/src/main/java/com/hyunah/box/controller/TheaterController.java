package com.hyunah.box.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyunah.box.model.Theater;
import com.hyunah.box.service.TheaterService;

@Controller
@RequestMapping("/theater")
public class TheaterController {
	private final String path = "theater/";
	

	@Autowired
	TheaterService tService;

	@RequestMapping({"","/","list"})
	public String list(Model model) {
		List<Theater> list = tService.list();
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@GetMapping("/add")
	public String add() {
		
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(Theater theater) {
		tService.add(theater);
		return "redirect:list";
	}
	
	@GetMapping("/update/{theaterCode}")
	public String update(@PathVariable int theaterCode, Model model) {
		Theater item = tService.getItem(theaterCode);
		model.addAttribute("item", item);

		return path + "update";
	}
	@PostMapping("/update/{theaterCode}")
	public String update(@PathVariable int theaterCode, Theater theater) {
		theater.setTheaterCode(theaterCode);
		tService.update(theater);
		
		return "redirect:../list";
	}
	
	@RequestMapping("/delete/{theaterCode}")
	public String delete(@PathVariable int theaterCode) {
		tService.delete(theaterCode);
		return "redirect:../list";
	}
	

	
}
