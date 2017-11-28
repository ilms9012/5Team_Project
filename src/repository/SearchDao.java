package repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.SearchMapper;
import vo.StatVO;

@Component
public class SearchDao {
	@Autowired
	public SqlSessionTemplate session;
	
	public int Insert(StatVO stat) {
		SearchMapper mapper = session.getMapper(SearchMapper.class);
		return mapper.insert(stat);
	}
}
