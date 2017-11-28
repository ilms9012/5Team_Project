package pubgapi.test;

import java.util.List;

import org.springframework.context.annotation.Profile;

import pubgapi.core.JPubg;
import pubgapi.enums.PUBGMode;
import pubgapi.enums.PUBGRegion;
import pubgapi.enums.PUBGSeason;
import pubgapi.enums.PUBGStat;
import pubgapi.factory.JPubgFactory;
import pubgapi.vo.FilterCriteria;
import pubgapi.vo.Player;
import pubgapi.vo.Stat;

public class Test {
	public static void main(String[] args) {
		// Always remember to specify your API key
		JPubg jPubg = JPubgFactory.getWrapper("47fc2c55-b8d9-411a-8ddc-63cd678e4dec");

		// We're filtering by mode, region and season here
		FilterCriteria criteria = new FilterCriteria();
		criteria.setMode(PUBGMode.squad);
		criteria.setRegion(PUBGRegion.as);
		criteria.setSeason(PUBGSeason.PRE5_2017);

		Player player = null;
		
		// Always remember to use try-catch block for error processing!
		try {
				
		      player = jPubg.getByNickname("ABP-532", criteria);
		} catch (IllegalArgumentException e) {
		      System.out.println("Player could not be found or validated: " + e.getLocalizedMessage());
		}

		if(player != null) {
		      // We would like to retrieve best rating for player "TheHusar" for season PRE2_2017
		      Stat stat = jPubg.getPlayerMatchStatByStatName(player, PUBGStat.ROUND_MOST_KILLS);
		      Stat stat2 = jPubg.getPlayerMatchStatByStatName(player, PUBGStat.KILLS);
		      // You can get season name directly from stat object
		      System.out.println("Player " + player.getPlayerName() + " best rating in season: " + stat.getSeason().getSeasonName() + " is: " +   stat.getStringValue());
		      System.out.println();
		}
	}
}
