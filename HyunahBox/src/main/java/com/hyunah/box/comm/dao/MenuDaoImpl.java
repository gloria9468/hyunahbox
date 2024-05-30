package com.hyunah.box.comm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyunah.box.model.MemberRole;
import com.hyunah.box.model.Menu;

@Repository
public class MenuDaoImpl implements MenuDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public List<Menu> getMenuList(MemberRole memberRole) {
		return sql.selectList("menu.list", memberRole);
	}

}
