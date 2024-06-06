package com.hyunah.box.menu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyunah.box.menu.dao.CommDao;

@Service
public class CommServiceImpl implements CommService {

	@Autowired
	CommDao commDao;
	
	@Override
	public int getNextval(String seqName) {
		int nextval = commDao.getNextval(seqName);
		
		return nextval;
	}

}
