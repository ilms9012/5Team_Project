package service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import repository.PubgtrackerAPIDao;
import repository.SearchDao;
import vo.StatVO;

@Component
public class SearchService {
	@Autowired
	private SearchDao dao;
	@Autowired
	private PubgtrackerAPIDao apiDao;

	public List<StatVO> statSearch(String nickname) {
		List<StatVO> statList = new ArrayList<>();
		StatVO nullVO = new StatVO(nickname, "null", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
		for (int i = 1; i < 7; i++) {
			if (dao.selectMode(i, nickname) != 0) {
				StatVO stat = apiDao.selectStat(nickname, i);
				dao.update(stat);
				statList.add(i - 1, stat);
			} else {
				StatVO stat = apiDao.selectStat(nickname, i);
				if(stat!=null) {
					dao.insert(stat);
					statList.add(i - 1, stat);
				}else {
					statList.add(i - 1, nullVO);
				}
			}
		}
		return statList;
	}
	
	// 프로필 사진 꺼내오기
	public String searchAvatar(String nickname) {
		return apiDao.selectAvatar(nickname);
	}

	// 비교할 게임모드 있는지 검색하기
	public List<Integer> compareMode(List<StatVO> result1, List<StatVO> result2) {
		List<Integer> compareMode = new ArrayList<>();
		for(int i=0; i<result1.size(); i++) {
			if(result1.get(i).getRating() != 0 && result2.get(i).getRating() != 0) {
				compareMode.add(i+1);
			}
		}
		return compareMode;
	}
}
