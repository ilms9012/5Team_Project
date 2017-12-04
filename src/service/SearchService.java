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
	
	// ���� ���� �������� 
	// gameServer 0�̸� �ƽþ�, 1�̸� �ѱ�/�Ϻ�
	public List<StatVO> searchServerStat(int gameServer, String nickname) {
		List<StatVO> statList = new ArrayList<>();
		StatVO nullVO = new StatVO(nickname, "null", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
		for (int i = gameServer*3+1; i < gameServer*3+4; i++) {
			StatVO stat = apiDao.selectStat(nickname, i);
			if (dao.selectMode(i, nickname) != 0) {
				dao.update(stat);
				statList.add(stat);
			} else {
//				StatVO stat = apiDao.selectStat(nickname, i);
				if(stat!=null) {
					dao.insert(stat);
					statList.add(stat);
				}else {
					statList.add(nullVO);
				}
			}
		}
		return statList;
	}
	
	// ������ ���� ��������
	public String searchAvatar(String nickname) {
		return apiDao.selectAvatar(nickname);
	}
}
