package com.hyunah.box.comm.controller;

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

import com.hyunah.box.comm.service.MenuService;
import com.hyunah.box.model.Member;
import com.hyunah.box.model.MemberRole;
import com.hyunah.box.model.Menu;
import com.hyunah.box.service.MemberService;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	MenuService menuService;
	
	
	@RequestMapping("/list")
	public String getMenuList( HttpSession session, Model model ) {
		MemberRole memberRole = (MemberRole) session.getAttribute("memberRole");
		if( memberRole == null ) {
			memberRole = new MemberRole();
			session.setAttribute("memberRole", memberRole);
		}

		List<Menu> menuList = menuService.getMenuList(memberRole);
		model.addAttribute("menuList", menuList);
		return "/include/menu/list";
	}
}
