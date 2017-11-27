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
	
	// �ӽ� ȸ������ + ���� �̸��� ������
	public boolean join(MemberVO member, HttpSession session) {
		member.setAuth("false");
		if(dao.insert(member) > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	// �̸���, �г��� �ߺ� ����
	public String joinCheck(String id, String nickName) {
		if(dao.selectId(id) != null) {
			return "idOverlap";
		} else if(dao.selectNick(nickName) != null) {
			return "nickOverlap";
		} else {
			return "true";
		}
	}
	
	// �̸���, �н����� Ȯ��
	public boolean login(String id, String password) {
		if(dao.selectIdPw(id, password) > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	// �����ڵ� üũ �� �̸��� ���� ���� ������Ʈ
	public boolean checkAuthNum(HttpSession session, int authNum, String id) {
		int joinCode = (int) session.getAttribute("joinCode");
		if(joinCode == authNum && dao.updateAuth(id) > 0) {
			return true;
		} else {
			return false;
		}
	}
}
