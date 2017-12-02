package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.SearchMapper;
import vo.StatVO;

@Component
public class SearchDao {
	@Autowired
	public SqlSessionTemplate session;

	public List<StatVO> selectList(String nickname) {
		SearchMapper mapper = session.getMapper(SearchMapper.class);
		return mapper.selectList(nickname);
	}

	public int insert(StatVO stat) {
		SearchMapper mapper = session.getMapper(SearchMapper.class);
		return mapper.insert(stat);
	}

	public int update(StatVO stat) {
		SearchMapper mapper = session.getMapper(SearchMapper.class);
		return mapper.update(stat);
	}
	public int selectMode(int modeNum,String nickname) {
		SearchMapper mapper = session.getMapper(SearchMapper.class);
		return mapper.selectMode(modeNum,nickname);
	}
}
