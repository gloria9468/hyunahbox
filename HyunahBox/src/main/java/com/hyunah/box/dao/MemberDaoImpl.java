package com.hyunah.box.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyunah.box.model.Member;

@Repository("/MemberDaoImpl")
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSession sql;

	@Override
	public Member login(String id) {
		return sql.selectOne("member.login", id);
	}

	@Override
	public void signup(Member item) {
		sql.insert("member.signup", item);

	}

	@Override
	public int idCheck(String id) {
		return sql.selectOne("member.idCheck", id);
	}

	@Override
	public Member getItem(String id) {
		return sql.selectOne("member.getItem", id);
	}

	@Override
	public void mypage(Member item) {
		sql.update("member.mypage", item);
	}
	

	@Override
	public String findId(String name, String phone) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("phone", phone);
		
		return sql.selectOne("member.findId", map);
	}

	@Override
	public Member findPw(String id) {
		return sql.selectOne("member.findPw", id);
	}

	@Override
	public Member pwInfo(String id) {
		return sql.selectOne("member.pwInfo", id);
	}

	@Override
	public void updatePw(String id, String pw) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		
		sql.update("member.updatePw", map);
	}

	@Override
	public void withdraw(String id) {
		sql.delete("member.withdraw",id);
	}


}
