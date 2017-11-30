package pubgapi.result;

import java.util.ArrayList;
import java.util.List;

import pubgapi.core.JPubg;
import pubgapi.enums.PUBGMode;
import pubgapi.enums.PUBGRegion;
import pubgapi.enums.PUBGSeason;
import pubgapi.enums.PUBGStat;
import pubgapi.factory.JPubgFactory;
import pubgapi.vo.FilterCriteria;
import pubgapi.vo.Player;
import pubgapi.vo.Stat;
import vo.StatVO;

public class StatSearch {
	public static final String API_KEY = "47fc2c55-b8d9-411a-8ddc-63cd678e4dec";

	public StatVO selectStatAsSolo(String nickname,int game_Mode) {
		JPubg jPubg = JPubgFactory.getWrapper(API_KEY);

		FilterCriteria asSoloCriteria = new FilterCriteria(PUBGMode.solo, PUBGRegion.as, PUBGSeason.PRE5_2017); // 1

		Player asSolo = null; // 1

		try {
			System.out.println(nickname);
			asSolo = jPubg.getByNickname(nickname, asSoloCriteria);

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
			asSoloVO.setGame_mode(game_Mode);
			asSoloVO.setRating(Integer.parseInt(stat.get(0).getStringValue()));
			asSoloVO.setWin_Ratio(stat.get(1).getDecimalValue());
			asSoloVO.setKill_Death_Ratio(stat.get(2).getDecimalValue());
			asSoloVO.setDamage_Per_Game(stat.get(3).getDecimalValue());
			asSoloVO.setTop10_Ratio(stat.get(4).getDecimalValue());
			asSoloVO.setTime_Survived_Per_Game(stat.get(5).getDecimalValue());
			asSoloVO.setRound_Most_Kill(stat.get(6).getIntegerValue());
			asSoloVO.setHeadshot_Kill_Ratio(stat.get(7).getDecimalValue());
			asSoloVO.setWins(stat.get(8).getIntegerValue());
			asSoloVO.setTop_10(stat.get(9).getIntegerValue());
			asSoloVO.setLosses(stat.get(10).getIntegerValue());
			
			return asSoloVO;
		}else {
			return null;
		}
	}

	public StatVO selectStatAsDuo(String nickname,int game_Mode) {
		JPubg jPubg = JPubgFactory.getWrapper(API_KEY);

		FilterCriteria asDuoCriteria = new FilterCriteria(PUBGMode.duo, PUBGRegion.as, PUBGSeason.PRE5_2017); // 2

		Player asDuo = null; // 2

		try {
			System.out.println(nickname);
			asDuo = jPubg.getByNickname(nickname, asDuoCriteria);

		} catch (IllegalArgumentException e) {
			System.out.println("플레이어를 찾을 수 없습니다." + e.getLocalizedMessage());
			return null;
		}

		if (asDuo != null) {
			List<Stat> stat = new ArrayList<Stat>();
			stat.add(0, jPubg.getPlayerMatchStatByStatName(asDuo, PUBGStat.RATING));
			stat.add(1, jPubg.getPlayerMatchStatByStatName(asDuo, PUBGStat.WIN_RATIO));
			stat.add(2, jPubg.getPlayerMatchStatByStatName(asDuo, PUBGStat.KILL_DEATH_RATIO));
			stat.add(3, jPubg.getPlayerMatchStatByStatName(asDuo, PUBGStat.DAMAGE_PER_GAME));
			stat.add(4, jPubg.getPlayerMatchStatByStatName(asDuo, PUBGStat.TOP_10_RATIO));
			stat.add(5, jPubg.getPlayerMatchStatByStatName(asDuo, PUBGStat.TIME_SURVIVED_PER_GAME));
			stat.add(6, jPubg.getPlayerMatchStatByStatName(asDuo, PUBGStat.ROUND_MOST_KILLS));
			stat.add(7, jPubg.getPlayerMatchStatByStatName(asDuo, PUBGStat.HEADSHOT_KILL_RATIO));
			stat.add(8, jPubg.getPlayerMatchStatByStatName(asDuo, PUBGStat.WINS));
			stat.add(9, jPubg.getPlayerMatchStatByStatName(asDuo, PUBGStat.TOP_10));
			stat.add(10, jPubg.getPlayerMatchStatByStatName(asDuo, PUBGStat.LOSSES));

			StatVO asDuoVO = new StatVO();
			asDuoVO.setNickname(nickname);
			asDuoVO.setGame_mode(game_Mode);
			asDuoVO.setRating(Integer.parseInt(stat.get(0).getStringValue()));
			asDuoVO.setWin_Ratio(stat.get(1).getDecimalValue());
			asDuoVO.setKill_Death_Ratio(stat.get(2).getDecimalValue());
			asDuoVO.setDamage_Per_Game(stat.get(3).getDecimalValue());
			asDuoVO.setTop10_Ratio(stat.get(4).getDecimalValue());
			asDuoVO.setTime_Survived_Per_Game(stat.get(5).getDecimalValue());
			asDuoVO.setRound_Most_Kill(stat.get(6).getIntegerValue());
			asDuoVO.setHeadshot_Kill_Ratio(stat.get(7).getDecimalValue());
			asDuoVO.setWins(stat.get(8).getIntegerValue());
			asDuoVO.setTop_10(stat.get(9).getIntegerValue());
			asDuoVO.setLosses(stat.get(10).getIntegerValue());
			
			return asDuoVO;
		}else {
			return null;
		}
	}

	public StatVO selectStatAsSquad(String nickname,int game_Mode) {
		JPubg jPubg = JPubgFactory.getWrapper(API_KEY);

		FilterCriteria asSquadCriteria = new FilterCriteria(PUBGMode.squad, PUBGRegion.as, PUBGSeason.PRE5_2017); // 3

		Player asSquad = null; // 3

		try {
			System.out.println(nickname);
			asSquad = jPubg.getByNickname(nickname, asSquadCriteria);

		} catch (IllegalArgumentException e) {
			System.out.println("플레이어를 찾을 수 없습니다." + e.getLocalizedMessage());
			return null;
		}

		if (asSquad != null) {
			List<Stat> stat = new ArrayList<Stat>();
			stat.add(0, jPubg.getPlayerMatchStatByStatName(asSquad, PUBGStat.RATING));
			stat.add(1, jPubg.getPlayerMatchStatByStatName(asSquad, PUBGStat.WIN_RATIO));
			stat.add(2, jPubg.getPlayerMatchStatByStatName(asSquad, PUBGStat.KILL_DEATH_RATIO));
			stat.add(3, jPubg.getPlayerMatchStatByStatName(asSquad, PUBGStat.DAMAGE_PER_GAME));
			stat.add(4, jPubg.getPlayerMatchStatByStatName(asSquad, PUBGStat.TOP_10_RATIO));
			stat.add(5, jPubg.getPlayerMatchStatByStatName(asSquad, PUBGStat.TIME_SURVIVED_PER_GAME));
			stat.add(6, jPubg.getPlayerMatchStatByStatName(asSquad, PUBGStat.ROUND_MOST_KILLS));
			stat.add(7, jPubg.getPlayerMatchStatByStatName(asSquad, PUBGStat.HEADSHOT_KILL_RATIO));
			stat.add(8, jPubg.getPlayerMatchStatByStatName(asSquad, PUBGStat.WINS));
			stat.add(9, jPubg.getPlayerMatchStatByStatName(asSquad, PUBGStat.TOP_10));
			stat.add(10, jPubg.getPlayerMatchStatByStatName(asSquad, PUBGStat.LOSSES));

			StatVO asSquadVO = new StatVO();
			asSquadVO.setNickname(nickname);
			asSquadVO.setGame_mode(game_Mode);
			asSquadVO.setRating(Integer.parseInt(stat.get(0).getStringValue()));
			asSquadVO.setWin_Ratio(stat.get(1).getDecimalValue());
			asSquadVO.setKill_Death_Ratio(stat.get(2).getDecimalValue());
			asSquadVO.setDamage_Per_Game(stat.get(3).getDecimalValue());
			asSquadVO.setTop10_Ratio(stat.get(4).getDecimalValue());
			asSquadVO.setTime_Survived_Per_Game(stat.get(5).getDecimalValue());
			asSquadVO.setRound_Most_Kill(stat.get(6).getIntegerValue());
			asSquadVO.setHeadshot_Kill_Ratio(stat.get(7).getDecimalValue());
			asSquadVO.setWins(stat.get(8).getIntegerValue());
			asSquadVO.setTop_10(stat.get(9).getIntegerValue());
			asSquadVO.setLosses(stat.get(10).getIntegerValue());
			
			return asSquadVO;
		}else {
			return null;
		}
	}

	public StatVO selectStatKrjpSolo(String nickname,int game_Mode) {
		JPubg jPubg = JPubgFactory.getWrapper(API_KEY);

		FilterCriteria krjpSoloCriteria = new FilterCriteria(PUBGMode.solo, PUBGRegion.krjp, PUBGSeason.PRE5_2017); // 4

		Player krjpSolo = null; // 4

		try {
			System.out.println(nickname);
			krjpSolo = jPubg.getByNickname(nickname, krjpSoloCriteria);

		} catch (IllegalArgumentException e) {
			System.out.println("플레이어를 찾을 수 없습니다." + e.getLocalizedMessage());
			return null;
		}

		if (krjpSolo != null) {
			List<Stat> stat = new ArrayList<Stat>();
			stat.add(0, jPubg.getPlayerMatchStatByStatName(krjpSolo, PUBGStat.RATING));
			stat.add(1, jPubg.getPlayerMatchStatByStatName(krjpSolo, PUBGStat.WIN_RATIO));
			stat.add(2, jPubg.getPlayerMatchStatByStatName(krjpSolo, PUBGStat.KILL_DEATH_RATIO));
			stat.add(3, jPubg.getPlayerMatchStatByStatName(krjpSolo, PUBGStat.DAMAGE_PER_GAME));
			stat.add(4, jPubg.getPlayerMatchStatByStatName(krjpSolo, PUBGStat.TOP_10_RATIO));
			stat.add(5, jPubg.getPlayerMatchStatByStatName(krjpSolo, PUBGStat.TIME_SURVIVED_PER_GAME));
			stat.add(6, jPubg.getPlayerMatchStatByStatName(krjpSolo, PUBGStat.ROUND_MOST_KILLS));
			stat.add(7, jPubg.getPlayerMatchStatByStatName(krjpSolo, PUBGStat.HEADSHOT_KILL_RATIO));
			stat.add(8, jPubg.getPlayerMatchStatByStatName(krjpSolo, PUBGStat.WINS));
			stat.add(9, jPubg.getPlayerMatchStatByStatName(krjpSolo, PUBGStat.TOP_10));
			stat.add(10, jPubg.getPlayerMatchStatByStatName(krjpSolo, PUBGStat.LOSSES));

			StatVO krjpSoloVO = new StatVO();
			krjpSoloVO.setNickname(nickname);
			krjpSoloVO.setGame_mode(game_Mode);
			krjpSoloVO.setRating(Integer.parseInt(stat.get(0).getStringValue()));
			krjpSoloVO.setWin_Ratio(stat.get(1).getDecimalValue());
			krjpSoloVO.setKill_Death_Ratio(stat.get(2).getDecimalValue());
			krjpSoloVO.setDamage_Per_Game(stat.get(3).getDecimalValue());
			krjpSoloVO.setTop10_Ratio(stat.get(4).getDecimalValue());
			krjpSoloVO.setTime_Survived_Per_Game(stat.get(5).getDecimalValue());
			krjpSoloVO.setRound_Most_Kill(stat.get(6).getIntegerValue());
			krjpSoloVO.setHeadshot_Kill_Ratio(stat.get(7).getDecimalValue());
			krjpSoloVO.setWins(stat.get(8).getIntegerValue());
			krjpSoloVO.setTop_10(stat.get(9).getIntegerValue());
			krjpSoloVO.setLosses(stat.get(10).getIntegerValue());
			
			return krjpSoloVO;
		}else {
			return null;
		}
	}

	public StatVO selectStatKrjpDuo(String nickname, int game_Mode) {
		JPubg jPubg = JPubgFactory.getWrapper(API_KEY);

		FilterCriteria krjpDuoCriteria = new FilterCriteria(PUBGMode.duo, PUBGRegion.krjp, PUBGSeason.PRE5_2017); // 5

		Player krjpDuo = null; // 5

		try {
			System.out.println(nickname);
			krjpDuo = jPubg.getByNickname(nickname, krjpDuoCriteria);

		} catch (IllegalArgumentException e) {
			System.out.println("플레이어를 찾을 수 없습니다." + e.getLocalizedMessage());
		}

		if (krjpDuo != null) {
			List<Stat> stat = new ArrayList<Stat>();
			stat.add(0, jPubg.getPlayerMatchStatByStatName(krjpDuo, PUBGStat.RATING));
			stat.add(1, jPubg.getPlayerMatchStatByStatName(krjpDuo, PUBGStat.WIN_RATIO));
			stat.add(2, jPubg.getPlayerMatchStatByStatName(krjpDuo, PUBGStat.KILL_DEATH_RATIO));
			stat.add(3, jPubg.getPlayerMatchStatByStatName(krjpDuo, PUBGStat.DAMAGE_PER_GAME));
			stat.add(4, jPubg.getPlayerMatchStatByStatName(krjpDuo, PUBGStat.TOP_10_RATIO));
			stat.add(5, jPubg.getPlayerMatchStatByStatName(krjpDuo, PUBGStat.TIME_SURVIVED_PER_GAME));
			stat.add(6, jPubg.getPlayerMatchStatByStatName(krjpDuo, PUBGStat.ROUND_MOST_KILLS));
			stat.add(7, jPubg.getPlayerMatchStatByStatName(krjpDuo, PUBGStat.HEADSHOT_KILL_RATIO));
			stat.add(8, jPubg.getPlayerMatchStatByStatName(krjpDuo, PUBGStat.WINS));
			stat.add(9, jPubg.getPlayerMatchStatByStatName(krjpDuo, PUBGStat.TOP_10));
			stat.add(10, jPubg.getPlayerMatchStatByStatName(krjpDuo, PUBGStat.LOSSES));

			StatVO krjpDuoVO = new StatVO();
			krjpDuoVO.setNickname(nickname);
			krjpDuoVO.setGame_mode(game_Mode);
			krjpDuoVO.setRating(Integer.parseInt(stat.get(0).getStringValue()));
			krjpDuoVO.setWin_Ratio(stat.get(1).getDecimalValue());
			krjpDuoVO.setKill_Death_Ratio(stat.get(2).getDecimalValue());
			krjpDuoVO.setDamage_Per_Game(stat.get(3).getDecimalValue());
			krjpDuoVO.setTop10_Ratio(stat.get(4).getDecimalValue());
			krjpDuoVO.setTime_Survived_Per_Game(stat.get(5).getDecimalValue());
			krjpDuoVO.setRound_Most_Kill(stat.get(6).getIntegerValue());
			krjpDuoVO.setHeadshot_Kill_Ratio(stat.get(7).getDecimalValue());
			krjpDuoVO.setWins(stat.get(8).getIntegerValue());
			krjpDuoVO.setTop_10(stat.get(9).getIntegerValue());
			krjpDuoVO.setLosses(stat.get(10).getIntegerValue());

			return krjpDuoVO;
		}else {
			return null;
		}
	}
	public StatVO selectStatKrjpSquad(String nickname,int game_Mode) {
		JPubg jPubg = JPubgFactory.getWrapper(API_KEY);

		FilterCriteria krjpSquadCriteria = new FilterCriteria(PUBGMode.squad, PUBGRegion.krjp, PUBGSeason.PRE5_2017); // 6

		Player krjpSquad = null; // 6

		try {
			System.out.println(nickname);
			krjpSquad = jPubg.getByNickname(nickname, krjpSquadCriteria);

		} catch (IllegalArgumentException e) {
			System.out.println("플레이어를 찾을 수 없습니다." + e.getLocalizedMessage());
			return null;
		}

		if (krjpSquad != null) {
			List<Stat> stat = new ArrayList<Stat>();
			stat.add(0, jPubg.getPlayerMatchStatByStatName(krjpSquad, PUBGStat.RATING));
			stat.add(1, jPubg.getPlayerMatchStatByStatName(krjpSquad, PUBGStat.WIN_RATIO));
			stat.add(2, jPubg.getPlayerMatchStatByStatName(krjpSquad, PUBGStat.KILL_DEATH_RATIO));
			stat.add(3, jPubg.getPlayerMatchStatByStatName(krjpSquad, PUBGStat.DAMAGE_PER_GAME));
			stat.add(4, jPubg.getPlayerMatchStatByStatName(krjpSquad, PUBGStat.TOP_10_RATIO));
			stat.add(5, jPubg.getPlayerMatchStatByStatName(krjpSquad, PUBGStat.TIME_SURVIVED_PER_GAME));
			stat.add(6, jPubg.getPlayerMatchStatByStatName(krjpSquad, PUBGStat.ROUND_MOST_KILLS));
			stat.add(7, jPubg.getPlayerMatchStatByStatName(krjpSquad, PUBGStat.HEADSHOT_KILL_RATIO));
			stat.add(8, jPubg.getPlayerMatchStatByStatName(krjpSquad, PUBGStat.WINS));
			stat.add(9, jPubg.getPlayerMatchStatByStatName(krjpSquad, PUBGStat.TOP_10));
			stat.add(10, jPubg.getPlayerMatchStatByStatName(krjpSquad, PUBGStat.LOSSES));

			StatVO krjpSquadVO = new StatVO();
			krjpSquadVO.setNickname(nickname);
			krjpSquadVO.setGame_mode(game_Mode);
			krjpSquadVO.setRating(Integer.parseInt(stat.get(0).getStringValue()));
			krjpSquadVO.setWin_Ratio(stat.get(1).getDecimalValue());
			krjpSquadVO.setKill_Death_Ratio(stat.get(2).getDecimalValue());
			krjpSquadVO.setDamage_Per_Game(stat.get(3).getDecimalValue());
			krjpSquadVO.setTop10_Ratio(stat.get(4).getDecimalValue());
			krjpSquadVO.setTime_Survived_Per_Game(stat.get(5).getDecimalValue());
			krjpSquadVO.setRound_Most_Kill(stat.get(6).getIntegerValue());
			krjpSquadVO.setHeadshot_Kill_Ratio(stat.get(7).getDecimalValue());
			krjpSquadVO.setWins(stat.get(8).getIntegerValue());
			krjpSquadVO.setTop_10(stat.get(9).getIntegerValue());
			krjpSquadVO.setLosses(stat.get(10).getIntegerValue());
			
			return krjpSquadVO;
		}else {
			return null;
		}
	}
}
