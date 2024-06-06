package com.hyunah.box.util;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.hyunah.box.menu.service.MenuService;
import com.hyunah.box.model.Member;
import com.hyunah.box.model.Menu;

@Component
public class UtilFunc {
	
	@Autowired
	MenuService menuService;
	
	
	public List<Menu> menuListByRole(@SessionAttribute(name = "member", required = false) Member member, String role){
		List<Menu> menuList = menuService.getMenuList(member, role);
		
		
		return menuList;
	}
}
