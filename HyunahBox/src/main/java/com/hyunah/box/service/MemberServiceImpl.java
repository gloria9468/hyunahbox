package com.hyunah.box.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hyunah.box.dao.GradeDao;
import com.hyunah.box.dao.MemberDao;
import com.hyunah.box.model.Booking;
import com.hyunah.box.model.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao mDao;

	@Autowired
	GradeDao gDao;
	
	@Override
	public Member login(String id) {
		return mDao.login(id);
	}

	@Override
	@Transactional
	public void siginup(Member item) {
		mDao.signup(item);
		gDao.addGrade(item.getId());

	}

	@Override
	public boolean idCheck(String id) {
		if(mDao.idCheck(id) > 0 ) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public Member getItem(String id) {
		return mDao.getItem(id);
	}

	@Override
	public void mypage(Member item) {
		mDao.mypage(item);
	}

	@Override
	public String findId(String name, String phone) {
		return mDao.findId(name, phone);
	}

	@Override
	public Member findPw(String id) {
		return mDao.findPw(id);
	}

	@Override
	public Member pwInfo(String id) {
		return mDao.pwInfo(id);
	}

	@Override
	public void updatePw(String id, String pw) {
		mDao.updatePw(id, pw);
	}

	@Override
	public void withdraw(String id) {
		mDao.withdraw(id);
	}

	@Override
	public List<Booking> bookingList(String id) {
		return mDao.bookingList(id);
	}

	

}
