package controller;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		return "" + service.join(member, session);
	}
	
	@RequestMapping(value="/checkAuthNum.do", produces="application/text; charset=utf8")
    @ResponseBody
	public String checkAuthNum(HttpSession session, int authNum, String id) {
		// 인증 코드 체크하기
		return "" + service.checkAuthNum(session, authNum, id);
	}
	
	@RequestMapping(value="/sendMail.do", method=RequestMethod.POST, produces="application/json")
    @ResponseBody
    public String sendMail(HttpSession session, String id) {
		// 인증 메일 보내기
        int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
        String joinCode = String.valueOf(ran);
        session.setAttribute("joinCode", joinCode);
 
        String subject = "회원가입 인증 코드 발급 안내 입니다.";
        
        // 문자열 저장 및 변경을 위한 메모리 공간 가지는 것
        StringBuilder sb = new StringBuilder();
        
        sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");
        System.out.println("id : " + id);
        System.out.println(sb.toString());
        return ""+mailService.send(subject, sb.toString(), "blausues@gmail.com", id, null);
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
