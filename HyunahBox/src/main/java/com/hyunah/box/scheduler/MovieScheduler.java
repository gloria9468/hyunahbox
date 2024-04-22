package com.hyunah.box.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.hyunah.box.service.MovieService;

@Component
public class MovieScheduler {
	@Autowired
	private MovieService movieService;
	
	@Scheduled(cron = "0 34 16 * * *")
	public void getJsonDataFromKobis() throws Exception{
		movieService.getApiData();
	}
	
}
