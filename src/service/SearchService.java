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

	public List<StatVO> statSearch(String nickname) {
		List<StatVO> statList = new ArrayList<StatVO>();
		statList = dao.selectList(nickname);
		
		JPubg jPubg = JPubgFactory.getWrapper(API_KEY);
		
		FilterCriteria asSoloCriteria = new FilterCriteria(PUBGMode.solo, PUBGRegion.as, PUBGSeason.PRE5_2017);   //1
		FilterCriteria asDuoCriteria = new FilterCriteria(PUBGMode.duo, PUBGRegion.as, PUBGSeason.PRE5_2017); 	//2
		FilterCriteria asSquadCriteria = new FilterCriteria(PUBGMode.squad, PUBGRegion.as, PUBGSeason.PRE5_2017);	//3
		FilterCriteria krjpSoloCriteria = new FilterCriteria(PUBGMode.solo, PUBGRegion.krjp, PUBGSeason.PRE5_2017);	//4
		FilterCriteria krjpDuoCriteria = new FilterCriteria(PUBGMode.duo, PUBGRegion.krjp, PUBGSeason.PRE5_2017);	//5
		FilterCriteria krjpSquadCriteria = new FilterCriteria(PUBGMode.squad, PUBGRegion.krjp, PUBGSeason.PRE5_2017);	//6
		
		
		Player asSolo = null;    //1
		Player asDuo = null;	//2
		Player asSquad = null;	//3	
		Player krjpSolo = null;	//4
		Player krjpDuo = null;	//5
		Player krjpSquad = null;	//6
		
		try {
			System.out.println(nickname);
			asSolo = jPubg.getByNickname(nickname, asSoloCriteria);
			asDuo = jPubg.getByNickname(nickname, asDuoCriteria);
			asSquad = jPubg.getByNickname(nickname, asSquadCriteria);
			krjpSolo = jPubg.getByNickname(nickname, krjpSoloCriteria);
			krjpDuo = jPubg.getByNickname(nickname, krjpDuoCriteria);
			krjpSquad = jPubg.getByNickname(nickname, krjpSquadCriteria);
			
		} catch (IllegalArgumentException e) {
			System.out.println("플레이어를 찾을 수 없습니다." + e.getLocalizedMessage());
			return null;
		}

		if (asSolo != null) {
			List<Stat> stat = new ArrayList<Stat>();
			stat.add(0, jPubg.getPlayerMatchStatByStatName(asSolo, PUBGStat.RATING));
			stat.add(1, jPubg.getPlayerMatchStatByStatName(asSolo, PUBGStat.WIN_RATIO));
			stat.add(2, jPubg.getPlayerMatchStatByStatName(asSolo, PUBGStat.KILL_DEATH_RATIO));
			stat.add(3, jPubg.getPlayerMatchStatByStatName(asSolo, PUBGStat.DAMAGE_PER_GAME));
			stat.add(4, jPubg.getPlayerMatchStatByStatName(asSolo, PUBGStat.TOP_10_RATIO));
			stat.add(5, jPubg.getPlayerMatchStatByStatName(asSolo, PUBGStat.TIME_SURVIVED_PER_GAME));
			stat.add(6, jPubg.getPlayerMatchStatByStatName(asSolo, PUBGStat.ROUND_MOST_KILLS));
			stat.add(7, jPubg.getPlayerMatchStatByStatName(asSolo, PUBGStat.HEADSHOT_KILL_RATIO));
			stat.add(8, jPubg.getPlayerMatchStatByStatName(asSolo, PUBGStat.WINS));
			stat.add(9, jPubg.getPlayerMatchStatByStatName(asSolo, PUBGStat.TOP_10));
			stat.add(10, jPubg.getPlayerMatchStatByStatName(asSolo, PUBGStat.LOSSES));
			

			StatVO asSoloVO = new StatVO();
			asSoloVO.setNickname(nickname);
			asSoloVO.setRating(Integer.parseInt(stat.get(0).getStringValue()));
			asSoloVO.setWin_Ratio(stat.get(1).getDecimalValue());
			asSoloVO.setKill_Death_Ratio(stat.get(2).getDecimalValue());
			asSoloVO.setDamage_Per_Game(stat.get(3).getDecimalValue());
			asSoloVO.setTop10_Ratio(stat.get(4).getDecimalValue());
			asSoloVO.setTime_Survived_Per_Game(stat.get(5).getDecimalValue());
			asSoloVO.setRound_Most_Kill(stat.get(6).getIntegerValue());

			dao.insert(asSoloVO);
			statList.add(0, asSoloVO);

		}
		if(asDuo !=null) {
			List<Stat> stat = new ArrayList<Stat>();
			stat.add(0, jPubg.getPlayerMatchStatByStatName(asDuo, PUBGStat.RATING));
			stat.add(1, jPubg.getPlayerMatchStatByStatName(asDuo, PUBGStat.WIN_RATIO));
			stat.add(2, jPubg.getPlayerMatchStatByStatName(asDuo, PUBGStat.KILL_DEATH_RATIO));
			stat.add(3, jPubg.getPlayerMatchStatByStatName(asDuo, PUBGStat.DAMAGE_PER_GAME));
			stat.add(4, jPubg.getPlayerMatchStatByStatName(asDuo, PUBGStat.TOP_10_RATIO));
			stat.add(5, jPubg.getPlayerMatchStatByStatName(asDuo, PUBGStat.TIME_SURVIVED_PER_GAME));
			stat.add(6, jPubg.getPlayerMatchStatByStatName(asDuo, PUBGStat.ROUND_MOST_KILLS));

			StatVO asDuoVO = new StatVO();
			asDuoVO.setNickname(nickname);
			asDuoVO.setRating(Integer.parseInt(stat.get(0).getStringValue()));
			asDuoVO.setWin_Ratio(stat.get(1).getDecimalValue());
			asDuoVO.setKill_Death_Ratio(stat.get(2).getDecimalValue());
			asDuoVO.setDamage_Per_Game(stat.get(3).getDecimalValue());
			asDuoVO.setTop10_Ratio(stat.get(4).getDecimalValue());
			asDuoVO.setTime_Survived_Per_Game(stat.get(5).getDecimalValue());
			asDuoVO.setRound_Most_Kill(stat.get(6).getIntegerValue());

			dao.insert(asDuoVO);
			statList.add(0, asDuoVO);
		}
		return statList;
	}

}
