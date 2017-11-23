package pubgapi.core;

import javax.annotation.Nonnull;

import pubgapi.enums.PUBGStat;
import pubgapi.services.HttpService;
import pubgapi.services.MatchStatFilterService;
import pubgapi.services.PlayerDataFilterService;
import pubgapi.vo.FilterCriteria;
import pubgapi.vo.Player;
import pubgapi.vo.Stat;

/**
 * Created by Łukasz "Husar" Górny on 2017-06-29.
 */
public final class JPubgImpl implements JPubg {

    private HttpService httpService;
    private PlayerDataFilterService playerDataFilterService;
    private MatchStatFilterService matchStatFilterService;

    public JPubgImpl(String apiKey) {
        httpService = new HttpService(apiKey);
        playerDataFilterService = new PlayerDataFilterService();
        matchStatFilterService = new MatchStatFilterService();
    }

    public JPubgImpl(String apiKey, int connectionTimeout) {
        httpService = new HttpService(apiKey, connectionTimeout);
        playerDataFilterService = new PlayerDataFilterService();
        matchStatFilterService = new MatchStatFilterService();
    }

    @Override
    @Deprecated
    public String getByNickname(@Nonnull final String nickname) {
        return httpService.executeGetByNicknameAction(nickname);
    }

    @Override
    public Player getByNickname(@Nonnull final String nickname, final FilterCriteria criteria) {
        String data = httpService.executeGetByNicknameAction(nickname);
        return playerDataFilterService.getPlayerByCriteria(data, criteria);
    }

    @Override
    @Deprecated
    public String getBySteamID(@Nonnull final String steamID) {
        return httpService.executeGetBySteamIDAction(steamID);
    }

    @Override
    public Player getBySteamID(@Nonnull final String steamID, final FilterCriteria criteria) {
        String data = httpService.executeGetBySteamIDAction(steamID);
        return playerDataFilterService.getPlayerByCriteria(data, criteria);
    }

    @Override
    public Stat getPlayerMatchStatByStatName(@Nonnull final Player player, @Nonnull final PUBGStat stat) {
        return matchStatFilterService.getStatFromSeasonMatches(player.getMatches(), stat);
    }

}