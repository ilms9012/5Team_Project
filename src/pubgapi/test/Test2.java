package pubgapi.test;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import pubgapi.core.JPubg;
import pubgapi.enums.PUBGMode;
import pubgapi.enums.PUBGRegion;
import pubgapi.enums.PUBGSeason;
import pubgapi.enums.PUBGStat;
import pubgapi.factory.JPubgFactory;
import pubgapi.vo.FilterCriteria;
import pubgapi.vo.Match;
import pubgapi.vo.Player;
import pubgapi.vo.Stat;

public class Test2 {
	public static void main(String[] args) {
		// Always remember to specify your API key
		JPubg jPubg = JPubgFactory.getWrapper("47fc2c55-b8d9-411a-8ddc-63cd678e4dec");

		// We're filtering by mode, region and season here
		FilterCriteria criteria = new FilterCriteria();
		criteria.setMode(PUBGMode.solo);
		criteria.setRegion(PUBGRegion.as);
		criteria.setSeason(PUBGSeason.PRE5_2017);

		Player player = null;

		// Always remember to use try-catch block for error processing!
		try {
			player = jPubg.getByNickname("BUDUU", criteria);
		} catch (IllegalArgumentException e) {
			System.out.println("Player could not be found or validated: " + e.getLocalizedMessage());
		}
		System.out.println(player.getAvatar());
		System.out.println("1");
		if (player != null) {
			System.out.println("2");
			// We would like to retrieve best rating for player "TheHusar" for season
			// PRE2_2017
			Stat stat = jPubg.getPlayerMatchStatByStatName(player, PUBGStat.AVERAGE_SURVIVAL_TIME);
			System.out.println("3");
			// You can get season name directly from stat object
			System.out.println(player.getDefaultSeason());
			System.out.println(player.getLastUpdated());
			System.out.println(player.getMatches());
			System.out.println(player.getPlayerName());
			System.out.println(player.getAccountId());
			System.out.println(stat.getStringValue());
			List<Match> match = new ArrayList<>();
			Iterator<Match> iterator = player.getMatches().iterator();
			while (iterator.hasNext()) {
				Match element = iterator.next();
				System.out.println(element);
			}
		}
	}
}
