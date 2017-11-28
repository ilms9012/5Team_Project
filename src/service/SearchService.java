package service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import pubgapi.core.JPubg;
import pubgapi.enums.PUBGMode;
import pubgapi.enums.PUBGRegion;
import pubgapi.enums.PUBGSeason;
import pubgapi.enums.PUBGStat;
import pubgapi.factory.JPubgFactory;
import pubgapi.vo.FilterCriteria;
import pubgapi.vo.Player;
import pubgapi.vo.Stat;
import repository.SearchDao;
import vo.StatVO;

@Component
public class SearchService {
	@Autowired
	private SearchDao dao;
	public static final String API_KEY = "47fc2c55-b8d9-411a-8ddc-63cd678e4dec";

	public StatVO statSearch(String nickname) {
		JPubg jPubg = JPubgFactory.getWrapper(API_KEY);

		FilterCriteria criteria = new FilterCriteria();
		criteria.setMode(PUBGMode.squad);
		criteria.setRegion(PUBGRegion.as);
		criteria.setSeason(PUBGSeason.PRE5_2017);

		Player player = null;

		try {

			player = jPubg.getByNickname(nickname, criteria);
		} catch (IllegalArgumentException e) {
			System.out.println("Player could not be found or validated: " + e.getLocalizedMessage());
		}

		if (player != null) {
			List<Stat> stat = new ArrayList<Stat>();
			stat.add(0, jPubg.getPlayerMatchStatByStatName(player, PUBGStat.RATING));
			stat.add(1, jPubg.getPlayerMatchStatByStatName(player, PUBGStat.WIN_RATIO));
			stat.add(2, jPubg.getPlayerMatchStatByStatName(player, PUBGStat.KILL_DEATH_RATIO));
			stat.add(3, jPubg.getPlayerMatchStatByStatName(player, PUBGStat.DAMAGE_PER_GAME));
			stat.add(4, jPubg.getPlayerMatchStatByStatName(player, PUBGStat.TOP_10_RATIO));
			stat.add(5, jPubg.getPlayerMatchStatByStatName(player, PUBGStat.TIME_SURVIVED_PER_GAME));
			stat.add(6, jPubg.getPlayerMatchStatByStatName(player, PUBGStat.ROUND_MOST_KILLS));

			StatVO vo = new StatVO();
			vo.setNickname(nickname);
			vo.setRating(stat.get(0).getIntegerValue());
			vo.setWin_Ratio(stat.get(1).getDecimalValue());
			vo.setKill_Death_Ratio(stat.get(2).getDecimalValue());
			vo.setDamage_Per_Game(stat.get(3).getDecimalValue());
			vo.setTop10_Ratio(stat.get(4).getDecimalValue());
			vo.setTime_Survived_Per_Game(stat.get(5).getIntegerValue());
			vo.setRound_Most_Kill(stat.get(6).getIntegerValue());
			
			dao.Insert(vo);
			return vo;
		} else {
			return null;
		}
	}
}
