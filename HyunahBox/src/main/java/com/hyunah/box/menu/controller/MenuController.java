package com.hyunah.box.menu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.hyunah.box.menu.service.MenuService;
import com.hyunah.box.model.Member;
import com.hyunah.box.model.MemberRole;
import com.hyunah.box.model.Menu;
import com.hyunah.box.service.MemberService;
import com.hyunah.box.util.UtilFunc;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	MenuService menuService;
	
	@Autowired
	UtilFunc utilFunc;
	
	
	@RequestMapping("/list")
	public String getMenuList( HttpSession session, Model model, @SessionAttribute(name = "member", required = false) Member member) {
		if( member != null ) {
			session.setAttribute("member", member);
			//System.out.println(member.getId() + "----" +member.getRole());
		}

		List<Menu> menuList = utilFunc.menuListByRole(member, "user");
		model.addAttribute("menuList", menuList);
		return "/include/menu/list";
	}
	
	
}
