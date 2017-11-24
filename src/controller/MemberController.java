package controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import service.MailServiceImpl;
import service.MemberService;
import vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private MailServiceImpl mailService;
	
	
	@RequestMapping("/joinCheck.do")
	@ResponseBody
	public String joinCheck(String id, String nickName) {
		// 이메일, 닉네임 중복여부 확인
		return service.joinCheck(id, nickName);
	}
	
	@RequestMapping("/join.do")
	@ResponseBody
	public String join(MemberVO member, HttpSession session) {
		return ""+service.join(member, session);
	}
	
	private Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
	
	@RequestMapping(value="/checkMail.do", produces="application/text; charset=utf8")
    @ResponseBody
	public String checkMail(String email) {
		// 인증 코드 체크하기
		MemberVO member = dao.selectId(email);
		return gson.toJson(member);
	}
	
	@RequestMapping(value="/sendMail.do", method=RequestMethod.POST, produces="application/json")
    @ResponseBody
    public boolean sendMail(HttpSession session, @RequestParam String email) {
		// 인증 메일 보내기
        int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
        String joinCode = String.valueOf(ran);
        session.setAttribute("joinCode", joinCode);
 
        String subject = "회원가입 인증 코드 발급 안내 입니다.";
        
        // 문자열 저장 및 변경을 위한 메모리 공간 가지는 것
        StringBuilder sb = new StringBuilder();
        
        sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");
        return ""+mailService.send(subject, sb.toString(), "아이디@gmail.com", email, null);
    }
	
	
	
	@RequestMapping("/joinAuth.do")
	public String joinAuth(String id) {
		if(service.joinAuth(id)) {
			
		}
		return "";
	}
	
	@RequestMapping("/login.do")
	public String login(HttpSession session, String id, String password) {
		if(service.login(id, password)) {
			session.setAttribute("loginId", id);
			return "login_success";
		} else {
			return "login_fail";
		}
	}
	

}
