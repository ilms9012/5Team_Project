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
	
	// ȸ������
	public String join(MemberVO member) {
		if (dao.insert(member) > 0) {
			return "true";
		} else {
			return "false";
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
	
	// �̸���, �н������ �г��� ��������
	public String login(String id, String password) {
		return dao.selectIdPw(id, password);
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
