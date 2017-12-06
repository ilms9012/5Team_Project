package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.FreeReplyMapper;
import vo.ReplyVO;

@Component
public class FreeReplyDao {
	@Autowired
    private SqlSessionTemplate session;
	
	public int insert(ReplyVO reply) {
		FreeReplyMapper mapper = 
                session.getMapper(FreeReplyMapper.class);
        return mapper.insert(reply);
	}
	public int afterInsert(int replyNum) {
		FreeReplyMapper mapper = 
                session.getMapper(FreeReplyMapper.class);
        return mapper.afterInsert(replyNum);
	}
	public int update(ReplyVO reply) {
		FreeReplyMapper mapper = 
                session.getMapper(FreeReplyMapper.class);
        return mapper.update(reply);
	}
	public int delete(int replyNum) {
		FreeReplyMapper mapper = 
                session.getMapper(FreeReplyMapper.class);
        return mapper.delete(replyNum);
	}
	public int deleteAll(int boardNum) {
		FreeReplyMapper mapper = 
                session.getMapper(FreeReplyMapper.class);
        return mapper.deleteAll(boardNum);
	}
	public ReplyVO select(int replyNum) {
		FreeReplyMapper mapper = 
                session.getMapper(FreeReplyMapper.class);
        return mapper.select(replyNum);
	}
	public List<ReplyVO> selectList(int boardNum, int startRow, int count){
		FreeReplyMapper mapper = 
                session.getMapper(FreeReplyMapper.class);
        return mapper.selectList(boardNum, startRow, startRow+count);
	}
	public int totalCount(int boardNum) {
		FreeReplyMapper mapper = 
                session.getMapper(FreeReplyMapper.class);
        return mapper.totalCount(boardNum);
	}

}
