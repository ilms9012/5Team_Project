package repository.mapper;

import java.util.List;

import vo.StatVO;

public interface SearchMapper {
	public List<StatVO> selectList(String nickname);
	public int insert(StatVO stat);
	public int update(StatVO stat);
	
}
