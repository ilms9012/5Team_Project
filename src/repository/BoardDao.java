package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.BoardMapper;
import vo.BoardVO;

@Component
public class BoardDao {
	@Autowired
	private SqlSessionTemplate session;
///////////////////////////////////////////////////
	public int insert(BoardVO board) {
        BoardMapper mapper = 
                session.getMapper(BoardMapper.class);
        return mapper.insert(board);
    }
     
    public int selectCount() {
        BoardMapper mapper = 
                session.getMapper(BoardMapper.class);
        return mapper.selectTotalCount();
    }
     
    public BoardVO select(int boardNum) {
        BoardMapper mapper = 
                session.getMapper(BoardMapper.class);
        return mapper.select(boardNum);
    }
     
    public List<BoardVO> selectList(int startRow, int count){
        BoardMapper mapper = 
                session.getMapper(BoardMapper.class);
        return mapper.selectList(startRow, startRow+count);
    }
     
    public int updateReadCount(int boardNum) {
        BoardMapper mapper = 
                session.getMapper(BoardMapper.class);
        return mapper.updateReadCount(boardNum);
    }
     
    public int update(BoardVO board) {
        BoardMapper mapper = 
                session.getMapper(BoardMapper.class);
        return mapper.update(board);
    }
     
    public int delete(int boardNum) {
        BoardMapper mapper = 
                session.getMapper(BoardMapper.class);
        return mapper.delete(boardNum);
    }
    
	public int updateRecommendCount(int boardNum) {
		BoardMapper mapper = 
				session.getMapper(BoardMapper.class);
		return mapper.updateRecommendCount(boardNum);
	}
	
	
}




