package com.hyunah.box.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyunah.box.menu.dao.MenuDao;
import com.hyunah.box.model.Member;
import com.hyunah.box.model.MemberRole;
import com.hyunah.box.model.Menu;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	MenuDao menuDao;
	
	@Override
	public List<Menu> getMenuList(Member member, String role) {
		List<Menu> menuList = menuDao.getMenuList(member, role);
		return menuList;
	}

}
