package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import service.MailServiceImpl;
import service.MemberService;
import vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private MailServiceImpl mailService;
	
	@RequestMapping("/join.do")
	@ResponseBody
	public String join(MemberVO member) {
		String joinCheck = service.joinCheck
				(member.getId(), member.getNickName());
		if(joinCheck.equals("true")) {
			member.setAuth("false");
			return service.join(member);
		} else {
			return joinCheck;
		}
	}
	
	@RequestMapping(value="/kakaoJoin.do")
	@ResponseBody
	public String kakaoJoin(MemberVO member) {
		System.out.println(member.getAuth());
		String joinCheck = service.joinCheck
				(member.getId(), member.getNickName());
		if(joinCheck.equals("true")) {
			// 비밀번호가 1이면 카카오 로그인을 통한 회원가입
			member.setPassword("1");
			member.setAuth(member.getAuth());
			return service.join(member);
		} else {
			return joinCheck;
		}
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
			session.setAttribute("loginNick", );
			return "login_success";
		} else {
			return "login_fail";
		}
	}
	
	@RequestMapping(value="/kakaoLogin.do", method=RequestMethod.POST)
	@ResponseBody
	public void kakaoLogin(HttpSession session, @RequestParam("info") String info, HttpServletResponse resp) {
		JsonParser jsonParser = new JsonParser();
		JsonObject jsonObj = (JsonObject) jsonParser.parse(info);
		
		String id = jsonObj.get("kaccount_email").getAsString();
		String auth = jsonObj.get("kaccount_email_verified").getAsString();
		
		HashMap<String, Object> rs = new HashMap<String, Object>();
		
		Gson gson = new Gson();
		
		if(service.kakaoJoinCheck(id)) {
			// 만약 같은 id가 있고 비밀번호가 1이라면 회원가입한거니까 바로 로그인
			rs.put("check", "true");
			session.setAttribute("loginId", id);
		} else {
			rs.put("check", "false");
			rs.put("id", id);
			rs.put("auth", auth);
		}
		
		try {
			resp.getWriter().write(gson.toJson(rs));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "logout";
	}
}
