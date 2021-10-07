package com.hyunah.box.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyunah.box.model.Movie;
import com.hyunah.box.model.Schedule;
import com.hyunah.box.model.Theater;
import com.hyunah.box.service.MovieService;
import com.hyunah.box.service.ScheduleService;
import com.hyunah.box.service.TheaterService;

@Controller
@RequestMapping("/booking")
public class BookingController {
	private final String path = "booking/";
	
	@Autowired
	ScheduleService bookingService;
	
	@Autowired
	MovieService movieServie;
	
	@Autowired
	TheaterService theaterService;
	
	@RequestMapping({"/","","list"})
	public String bookingList(Model bookingModel, Model movieModel, Model theaterModel) {
		List<Schedule> bookingList = bookingService.list();
		bookingModel.addAttribute("bookingList",bookingList);
		
		List<Movie> movieList = movieServie.list();
		movieModel.addAttribute("movieList", movieList);
		
		List<Theater> theaterList = theaterService.list();
		theaterModel.addAttribute("theaterList", theaterList);
		
		
		return path + "list";
		
	}
	
	
}
