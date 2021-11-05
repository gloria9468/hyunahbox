package com.hyunah.box.dao;


import java.util.List;

import com.hyunah.box.model.Booking;
import com.hyunah.box.model.Member;

public interface MemberDao {


	Member login(String id);

	void signup(Member item);

	int idCheck(String id);

	Member getItem(String id);

	void mypage(Member item);

	String findId(String name, String phone);

	Member findPw(String id);

	Member pwInfo(String id);

	void updatePw(String id, String pw);

	void withdraw(String id);

	List<Booking> bookingList(String id);

	



}
