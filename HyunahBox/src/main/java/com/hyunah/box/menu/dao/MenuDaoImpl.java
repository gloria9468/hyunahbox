package com.hyunah.box.menu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyunah.box.model.Member;
import com.hyunah.box.model.MemberRole;
import com.hyunah.box.model.Menu;

@Repository
public class MenuDaoImpl implements MenuDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public List<Menu> getMenuList(Member member, String role) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("member", member);
		hashMap.put("role", role);
		
		return sql.selectList("menu.list", hashMap);
	}

}
