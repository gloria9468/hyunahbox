package com.hyunah.box.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hyunah.box.model.Member;
import com.hyunah.box.service.MemberService;


@Controller
public class RootController {

	@Autowired
	MemberService mService;


	@RequestMapping({"/","/main"})
	public String main() {
		return "main";
	}

	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}

	@PostMapping("/signup")
	public String signup(Member item){
		mService.siginup(item);
		return "redirect:main";
	}

	@ResponseBody
	@RequestMapping("/idCheck")
	public String idCheck(String id) {
		if(mService.idCheck(id))
			return "OK";
		else
			return "FAIL";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@PostMapping("/login")
	public String login(Member item, HttpSession session, RedirectAttributes reAtt) {
		Member member = mService.login(item.getId());
		if(member!= null) {//1.널을 먼저 체크 - 널은 아이디가 없다는 것.
			String id = member.getId();
			String pw = member.getPw();

			if(id.equals(item.getId()) && pw.equals(item.getPw()) ) {
				session.setAttribute("member", member);
				// db 에서 읽어온 member 라는 객체를 -  session에 member라고 저장해놓는 것. 객체를 넣어놓은 것.
				return "redirect:main";
			}
			reAtt.addFlashAttribute("msg","wrongPw");
			return "redirect:login"; //로그인 실패. -> 비밀번호가 틀림

		}
		reAtt.addFlashAttribute("msg","wrongId");
		return "redirect:login"; // 로그인 실패. -> 아이디가 틀림 또는 아예 존재조차 하지 않음.
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:main";
	}
	
	
	
	

}
