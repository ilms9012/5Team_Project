package pubgapi.services;

import java.util.List;
import java.util.stream.Collectors;
import com.google.common.base.Optional;
import com.google.common.base.Preconditions;

import pubgapi.vo.Match;
import pubgapi.vo.Stat;
import pubgapi.enums.PUBGStat;
import pubgapi.messages.Messages;

/**
 * Created by Łukasz "Husar" Górny on 2017-07-10.
 */
public class MatchStatFilterService {

    private MatchValidationService matchValidationService;

    public MatchStatFilterService() {
        this.matchValidationService = new MatchValidationService();
    }

    public Stat getStatFromSeasonMatches(final List<Match> matches, final PUBGStat statName) {
        Match match = getMatchFromSeason(matches);

        List<Stat> results = match.getStats().stream()
                                   .filter(stat -> statName.getLabelName().equals(stat.getField())).collect(Collectors.toList());

        Preconditions.checkState(results.size() == 1, Messages.BAD_NUMBER_OF_STATS_RETURNED);

        return results.get(0);
    }

    private Match getMatchFromSeason(List<Match> matches) {
        matchValidationService.validateWithSizeValidation(matches);

        Optional<List<Match>> optionalMatches = Optional.fromNullable(matches);
        Match match = optionalMatches.get().get(0);
        matchValidationService.validateSingleMatch(match);

        return match;
    }
}
