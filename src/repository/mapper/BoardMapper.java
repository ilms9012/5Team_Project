package repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.BoardVO;

public interface BoardMapper {
	public int insert(BoardVO board);
	public int selectTotalCount();
	public BoardVO select(int boardNum);
	public List<BoardVO> selectList
					(@Param("startRow")int startRow, 
					 @Param("count")int count);
	public int updateReadCount(int boardNum);
	public int update(BoardVO board);
	public int delete(int boardNum);
	public int updateRecommendCount(int boardNum);
	public List<BoardVO> bestPicList();
}
