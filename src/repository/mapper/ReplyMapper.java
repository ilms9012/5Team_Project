package repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.ReplyVO;

public interface ReplyMapper {
	public int insert(ReplyVO reply);
	public int afterInsert(int replyNum);
	public int update(ReplyVO reply);
	public int delete(int replyNum);
	public int deleteAll(int boardNum);
	public ReplyVO select(int replyNum);
	public List<ReplyVO> selectList(@Param("boardNum") int boardNum, @Param("startRow") int replyStartRow, @Param("count")int replyCount);
	public int totalCount(int boardNum);

}
