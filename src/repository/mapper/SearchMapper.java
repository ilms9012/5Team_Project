package repository.mapper;

import vo.StatVO;

public interface SearchMapper {
	public int insert(StatVO stat);
	public StatVO select(String nickname);
	public int update(StatVO stat);
}
