package com.hyunah.box.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hyunah.box.model.Member;
import com.hyunah.box.service.MemberService;


@Controller
@RequestMapping("/member")
public class MemberController {
	private final String path = "member/";

	@Autowired
	MemberService mService;


	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String mypage(@SessionAttribute Member member, Model model) {
		Member item = mService.getItem(member.getId());
		model.addAttribute("item", item);

		return path + "mypage";
	}

	@RequestMapping(value="/mypage", method=RequestMethod.POST)
	public String mypage(@SessionAttribute Member member, Member item) {
		item.setId(member.getId());
		mService.mypage(item);

		return "redirect:../main";
	}

	@GetMapping("/findPage")
	public String findPage() {
		return path + "findPage";
	}

	@GetMapping("/findId")
	public String findId() {
		return path + "findId";
	}
	@PostMapping("/findId")
	public String findId(String name, String phone, Model model,RedirectAttributes reAtt) {
		String id = mService.findId(name, phone); //이름과 번호에 맞는 아이디 찾아옴.

		if(id != null) {
			reAtt.addFlashAttribute("id", id);
			reAtt.addFlashAttribute("msg", "findId_success");
			return "redirect:/login";
		} else {
			reAtt.addFlashAttribute("msg", "wrong");
			return "redirect:findId";
		}
	}



	@GetMapping("/findPw")
	public String findPw() {
		return path + "findPw";
	}
	@PostMapping("/findPw")
	public String findPw(Member item, RedirectAttributes reAtt, Model model) {
		Member member = mService.findPw(item.getId());
		if(member != null) {//아이디는 맞음
			String name = member.getName();
			String phone = member.getPhone();

			//이름도 번호도 다 맞음
			if(name.equals(item.getName()) && phone.equals(item.getPhone()) ) {
				reAtt.addFlashAttribute("msg","newPw_success");
				model.addAttribute("member", member); //일치하는 회원을 model을 저장해서
				return "redirect:newPw/" + item.getId(); //새로운 비밀번호로 update하게 해줌.
			} else if(name.equals(item.getName())) { //이름은 맞음
				reAtt.addFlashAttribute("msg","wrongPhone");
				return "redirect:findPw";
			} else if(phone.equals(item.getPhone())) { //전화번호는 맞음
				reAtt.addFlashAttribute("msg","wrongName");
				return "redirect:findPw";
			} else { //둘 다 틀림.(아이디만 맞음)
				reAtt.addFlashAttribute("msg","wrongEverything");
				return "redirect:findPw";
			}
		} else { //(member == null)아이디가 틀림.
			reAtt.addFlashAttribute("msg","wrongId");
			return "redirect:findPw";
		}
	}

	@GetMapping("/newPw/{id}")
	public String newPw(@PathVariable String id ,Model model) {
		Member newPw = mService.pwInfo(id);
		model.addAttribute("newPw", newPw);
		return path + "newPw";
	}

	@PostMapping("/newPw/{id}")
	public String newPw(@PathVariable String id, Member newPw) {
		mService.updatePw(id,newPw.getPw());
		return "redirect:/main";
	}


	@GetMapping("/withdraw")
	public String withdraw() {
		return "withdraw";
	}
	@PostMapping("/withdraw")
	public String withdraw(HttpSession session, @SessionAttribute Member member, String id, String pw, RedirectAttributes reAtt) {
		
		//아이디가 같은지 먼저 보고 - 그 안에서 비밀번호도 같은지 보고 delete
		if(member.getId().equals(id)) {
			if(member.getPw().equals(pw)) {
				reAtt.addFlashAttribute("msg","withdraw_success");
				mService.withdraw(member.getId()); //delete
				session.invalidate();
				return "redirect:/main";
			}
			reAtt.addFlashAttribute("msg", "wrongPw");
			return "redirect:withdraw";
			
		} else {//아이디부터 틀렸음.
			reAtt.addFlashAttribute("msg", "wrongId");
			return "redirect:withdraw";
		}
	}



}

