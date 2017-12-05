package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.ReplyMapper;
import vo.ReplyVO;

@Component
public class ReplyDao {
	@Autowired
    private SqlSessionTemplate session;
	
	public int insert(ReplyVO reply) {
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.insert(reply);
	}
	public int afterInsert(int replyNum) {
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.afterInsert(replyNum);
	}
	public int update(ReplyVO reply) {
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.update(reply);
	}
	public int delete(int replyNum) {
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.delete(replyNum);
	}
	public int deleteAll(int boardNum) {
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.deleteAll(boardNum);
	}
	public ReplyVO select(int replyNum) {
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.select(replyNum);
	}
	public List<ReplyVO> selectList(int boardNum, int startRow, int count){
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.selectList(boardNum, startRow, startRow+count);
	}
	public int totalCount(int boardNum) {
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.totalCount(boardNum);
	}

}
