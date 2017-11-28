package service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.MemberDao;
import vo.MemberVO;

@Component
public class MemberService {
	@Autowired
	private MemberDao dao;
	
	// 임시 회원가입 + 인증 이메일 보내기
	public boolean join(MemberVO member, HttpSession session) {
		member.setAuth("false");
		if(dao.insert(member) > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	// 이메일, 닉네임 중복 여부
	public String joinCheck(String id, String nickName) {
		if(dao.selectId(id) != null) {
			return "idOverlap";
		} else if(dao.selectNick(nickName) != null) {
			return "nickOverlap";
		} else {
			return "true";
		}
	}
	
	// 이메일, 패스워드 확인
	public boolean login(String id, String password) {
		if(dao.selectIdPw(id, password) > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	// 인증코드 체크 후 이메일 인증 여부 업데이트
	public boolean checkAuthNum(HttpSession session, int authNum, String id) {
		int joinCode = (int) session.getAttribute("joinCode");
		if(joinCode == authNum && dao.updateAuth(id) > 0) {
			return true;
		} else {
			return false;
		}
	}
}
