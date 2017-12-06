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
	
	// 회원가입
	public String join(MemberVO member) {
		if (dao.insert(member) > 0) {
			return "true";
		} else {
			return "false";
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
	
	// 이메일, 패스워드로 닉네임 가져오기
	public String login(String id, String password) {
		return dao.selectIdPw(id, password);
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
