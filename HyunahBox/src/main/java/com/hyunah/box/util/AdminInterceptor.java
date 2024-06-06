package com.hyunah.box.util;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hyunah.box.model.Member;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		if(session != null) {
			Member member = (Member) session.getAttribute("member");
			if(member != null) {
				if("admin".equals(member.getRole())){
					return true;
				}
			}else {
				response.sendRedirect("/");
				return false;
			}
		}
		response.sendRedirect("/login");
		return false;
	}
}
