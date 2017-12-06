package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.FreeBoardMapper;
import vo.BoardVO;

@Component
public class FreeBoardDao {
	@Autowired
	private SqlSessionTemplate session;
///////////////////////////////////////////////////
	public int insert(BoardVO board) {
        FreeBoardMapper mapper = 
                session.getMapper(FreeBoardMapper.class);
        return mapper.insert(board);
    }
     
    public int selectCount() {
        FreeBoardMapper mapper = 
                session.getMapper(FreeBoardMapper.class);
        return mapper.selectTotalCount();
    }
     
    public BoardVO select(int boardNum) {
        FreeBoardMapper mapper = 
                session.getMapper(FreeBoardMapper.class);
        return mapper.select(boardNum);
    }
     
    public List<BoardVO> selectList(int startRow, int count){
        FreeBoardMapper mapper = 
                session.getMapper(FreeBoardMapper.class);
        return mapper.selectList(startRow, startRow+count);
    }
     
    public int updateReadCount(int boardNum) {
        FreeBoardMapper mapper = 
                session.getMapper(FreeBoardMapper.class);
        return mapper.updateReadCount(boardNum);
    }
     
    public int update(BoardVO board) {
        FreeBoardMapper mapper = 
                session.getMapper(FreeBoardMapper.class);
        return mapper.update(board);
    }
     
    public int delete(int boardNum) {
        FreeBoardMapper mapper = 
                session.getMapper(FreeBoardMapper.class);
        return mapper.delete(boardNum);
    }
    
	public int updateRecommendCount(int boardNum) {
		FreeBoardMapper mapper = 
				session.getMapper(FreeBoardMapper.class);
		return mapper.updateRecommendCount(boardNum);
	}
	
	
}




