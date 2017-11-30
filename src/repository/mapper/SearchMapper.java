package repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.StatVO;

public interface SearchMapper {
	public List<StatVO> selectList(String nickname);
	public int insert(StatVO stat);
	public int update(StatVO stat);
	public int selectMode(@Param("modeNum")int modeNum,@Param("nickname")String nickname);
	
}
