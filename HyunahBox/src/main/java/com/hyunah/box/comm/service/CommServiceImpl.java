package com.hyunah.box.comm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyunah.box.comm.dao.CommDao;

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
