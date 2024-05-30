package com.hyunah.box.comm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyunah.box.comm.dao.MenuDao;
import com.hyunah.box.model.MemberRole;
import com.hyunah.box.model.Menu;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	MenuDao menuDao;
	
	@Override
	public List<Menu> getMenuList(MemberRole memberRole) {
		List<Menu> menuList = menuDao.getMenuList(memberRole);
		return menuList;
	}

}
