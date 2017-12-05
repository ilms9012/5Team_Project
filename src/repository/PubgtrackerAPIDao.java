package repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

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

@Component
public class PubgtrackerAPIDao {

	@Autowired
	public static final String API_KEY = "47fc2c55-b8d9-411a-8ddc-63cd678e4dec";
	public StatVO selectStat(String nickname, int game_Mode) {
		JPubg jPubg = JPubgFactory.getWrapper(API_KEY);
		FilterCriteria Criteria;

		if (game_Mode == 1) {
			Criteria = new FilterCriteria(PUBGMode.solo, PUBGRegion.as, PUBGSeason.PRE5_2017);
		} else if (game_Mode == 2) {
			Criteria = new FilterCriteria(PUBGMode.duo, PUBGRegion.as, PUBGSeason.PRE5_2017); 
		} else if (game_Mode == 3) {
			Criteria = new FilterCriteria(PUBGMode.squad, PUBGRegion.as, PUBGSeason.PRE5_2017); 
		} else if (game_Mode == 4) {
			Criteria = new FilterCriteria(PUBGMode.solo, PUBGRegion.krjp, PUBGSeason.PRE5_2017); 
		} else if (game_Mode == 5) {
			Criteria = new FilterCriteria(PUBGMode.duo, PUBGRegion.krjp, PUBGSeason.PRE5_2017); 
		} else {
			Criteria = new FilterCriteria(PUBGMode.squad, PUBGRegion.krjp, PUBGSeason.PRE5_2017); 
		}

		Player player = null; 

		try {
			System.out.println(nickname);
			player = jPubg.getByNickname(nickname, Criteria);
		} catch (IllegalArgumentException e) {
			System.out.println("플레이어를 찾을 수 없습니다." + e.getLocalizedMessage());
			return null;
		}

		if (player != null) {
			List<Stat> stat = new ArrayList<Stat>();
			try {
				stat.add(0, jPubg.getPlayerMatchStatByStatName(player, PUBGStat.RATING));
				stat.add(1, jPubg.getPlayerMatchStatByStatName(player, PUBGStat.WIN_RATIO));
				stat.add(2, jPubg.getPlayerMatchStatByStatName(player, PUBGStat.KILL_DEATH_RATIO));
				stat.add(3, jPubg.getPlayerMatchStatByStatName(player, PUBGStat.DAMAGE_PER_GAME));
				stat.add(4, jPubg.getPlayerMatchStatByStatName(player, PUBGStat.TOP_10_RATIO));
				stat.add(5, jPubg.getPlayerMatchStatByStatName(player, PUBGStat.TIME_SURVIVED_PER_GAME));
				stat.add(6, jPubg.getPlayerMatchStatByStatName(player, PUBGStat.ROUND_MOST_KILLS));
				stat.add(7, jPubg.getPlayerMatchStatByStatName(player, PUBGStat.HEADSHOT_KILL_RATIO));
				stat.add(8, jPubg.getPlayerMatchStatByStatName(player, PUBGStat.WINS));
				stat.add(9, jPubg.getPlayerMatchStatByStatName(player, PUBGStat.TOP_10));
				stat.add(10, jPubg.getPlayerMatchStatByStatName(player, PUBGStat.LOSSES));
			} catch (Exception e) {
				return null;
			}

			StatVO playerVO = new StatVO();
			playerVO.setNickname(nickname);
			playerVO.setAvatar(player.getAvatar());
			playerVO.setGame_Mode(game_Mode);
			playerVO.setRating(Integer.parseInt(stat.get(0).getStringValue()));
			playerVO.setWin_Ratio(stat.get(1).getDecimalValue());
			playerVO.setKill_Death_Ratio(stat.get(2).getDecimalValue());
			playerVO.setDamage_Per_Game(stat.get(3).getDecimalValue());
			playerVO.setTop10_Ratio(stat.get(4).getDecimalValue());
			playerVO.setTime_Survived_Per_Game(stat.get(5).getDecimalValue());
			playerVO.setRound_Most_Kill(stat.get(6).getIntegerValue());
			playerVO.setHeadshot_Kill_Ratio(stat.get(7).getDecimalValue());
			playerVO.setWins(stat.get(8).getIntegerValue());
			playerVO.setTop_10(stat.get(9).getIntegerValue());
			playerVO.setLosses(stat.get(10).getIntegerValue());

			return playerVO;
		} else {
			return null;
		}
	}
	
	public String selectAvatar(String nickname) {
		JPubg jPubg = JPubgFactory.getWrapper(API_KEY);
		String avatar = "null";
		String player = jPubg.getByNickname(nickname);
		System.out.println(player);
		JsonParser jsonParser = new JsonParser();
		JsonObject jsonObj = (JsonObject) jsonParser.parse(player);
		
		try {
			avatar = jsonObj.get("Avatar").getAsString();
			System.out.println(avatar);
			return avatar;
		} catch (Exception e) {
			System.out.println("플레이어를 찾을 수 없습니다.");
			return "null";
		}
	}

}
