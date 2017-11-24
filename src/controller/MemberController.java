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
		// �̸���, �г��� �ߺ����� Ȯ��
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
		// ���� �ڵ� üũ�ϱ�
		MemberVO member = dao.selectId(email);
		return gson.toJson(member);
	}
	
	@RequestMapping(value="/sendMail.do", method=RequestMethod.POST, produces="application/json")
    @ResponseBody
    public boolean sendMail(HttpSession session, @RequestParam String email) {
		// ���� ���� ������
        int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
        String joinCode = String.valueOf(ran);
        session.setAttribute("joinCode", joinCode);
 
        String subject = "ȸ������ ���� �ڵ� �߱� �ȳ� �Դϴ�.";
        
        // ���ڿ� ���� �� ������ ���� �޸� ���� ������ ��
        StringBuilder sb = new StringBuilder();
        
        sb.append("������ ���� �ڵ�� " + joinCode + " �Դϴ�.");
        return ""+mailService.send(subject, sb.toString(), "���̵�@gmail.com", email, null);
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
