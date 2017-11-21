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
		if(dao.insert(member) > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean idCheck(String id) {
		if(dao.selectId(id) != null) {
			return false;
		} else {
			return true;
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
