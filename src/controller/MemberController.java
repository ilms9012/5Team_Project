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
	
	@ResponseBody
	@RequestMapping("joinCheck.do")
	public String joinCheck(String id, String nickName) {
		return service.joinCheck(id, nickName);
	}
	
	@ResponseBody
	@RequestMapping("join.do")
	public String join(MemberVO member) {
		return ""+service.join(member);
	}
	
	@RequestMapping("joinAuth.do")
	public String joinAuth(String id) {
		if(service.joinAuth(id)) {
			
		}
		return "";
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

}
