package com.hyunah.box.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.hyunah.box.model.Booking;
import com.hyunah.box.model.Member;
import com.hyunah.box.model.Movie;
import com.hyunah.box.model.Schedule;
import com.hyunah.box.model.SearchTimeTable;
import com.hyunah.box.model.SitsInfo;
import com.hyunah.box.model.Theater;
import com.hyunah.box.service.MovieService;
import com.hyunah.box.service.ScheduleService;
import com.hyunah.box.service.SitsInfoServie;
import com.hyunah.box.service.TheaterService;

@Controller
@RequestMapping("/booking")
public class BookingController {
	private final String path = "booking/";

	@Autowired
	ScheduleService bookingService;

	@Autowired
	MovieService movieService;

	@Autowired
	TheaterService theaterService;

	@Autowired
	SitsInfoServie sitsInfoService;

	@RequestMapping({ "/", "", "list" })
	public String bookingList(Model bookingModel, Model movieModel, Model theaterModel,
			@SessionAttribute(name = "member", required = false) Member member) {
		List<Schedule> bookingList = bookingService.list();
		bookingModel.addAttribute("bookingList", bookingList);

		String memId = "";
		if (member == null) {
			memId = "noMem";
		} else {
			memId = member.getId();
		}
		List<Movie> movieList = movieService.list(memId, "main");
		movieModel.addAttribute("movieList", movieList);

		List<Theater> theaterList = theaterService.list();
		theaterModel.addAttribute("theaterList", theaterList);

		return path + "list";

	}

	@ResponseBody
	@PostMapping("/getTimeTable")
	public List<Schedule> getTimeTable(@RequestBody SearchTimeTable item) {

		List<Schedule> getTimeTable = bookingService.getTimeTable(item.getClickDay(), item.getPickTheater1(),
				item.getTheaters(), item.getMovies());

		return getTimeTable;
	}

	
	@ResponseBody
	@PostMapping("/getSitsInfo") 
	public List<SitsInfo> getSitsInfo (@RequestBody Map<String, Object> map ){
		
		List<SitsInfo> getSitsInfo = sitsInfoService.getSitsInfo(map);
		
		return getSitsInfo;
	}
	
	@ResponseBody
	@PostMapping("/payment")
	public void payment(@RequestBody Booking booking) {
		
		System.out.println("-------"+ booking.getId() +"-------"+ booking.getSitsCode() +"-------"+ booking.getSelectedSits());
		sitsInfoService.payment(booking);
		
	}
	

}
