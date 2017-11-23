package repository.mapper;

import org.apache.ibatis.annotations.Param;

import vo.MemberVO;

public interface MemberMapper {
	public int insert(MemberVO member);
	public int selectIdPw(@Param("id")String id, @Param("password")String password);
	public MemberVO selectId(String id);
	public MemberVO selectNick(String nickName);
	public int updateAuth(String id);
}
