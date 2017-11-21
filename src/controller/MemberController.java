package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import service.MemberService;
import vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "join_form";
	}
	
	@ResponseBody
	@RequestMapping(value="idCheck.do")
	public String idCheck(String id) {
		return ""+service.idCheck(id);
	}

	@RequestMapping(value="join.do", method=RequestMethod.POST)
	public String join(MemberVO member) {
		if(service.join(member)) {
			return "join_success";
		} else {
			return "join_fail";
		}
	}
	
	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "login_form";
	}
	
	@RequestMapping("login.do")
	public String login(HttpSession session, String id, String password) {
		if(service.login(id, password)) {
			session.setAttribute("loginId", id);
			return "login_success";
		} else {
			return "login_fail";
		}
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		if(loginId != null && loginId.length() > 0) {
			session.invalidate();
			return "logout_success";
		} else {
			return "logout_fail";
		}
	}
	
}
