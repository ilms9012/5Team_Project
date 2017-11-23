package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.MemberDao;
import vo.MemberVO;

@Component
public class MemberService {
	@Autowired
	private MemberDao dao;
	
	public boolean join(MemberVO member) {
		member.setAuth("false");
		if(dao.insert(member) > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean joinAuth(String id) {
		if(dao.updateAuth(id) > 0) {
			return true;
		} else {
			return false;
		}
			
	}
	
	public String joinCheck(String id, String nickName) {
		if(dao.selectId(id) != null) {
			return "idOverlap";
		} else if(dao.selectNick(nickName) != null) {
			return "nickOverlap";
		} else {
			return "true";
		}
	}
	
	public boolean login(String id, String password) {
		if(dao.selectIdPw(id, password) > 0) {
			return true;
		} else {
			return false;
		}
	}
}
