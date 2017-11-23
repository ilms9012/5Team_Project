package pubgapi.services;

import com.google.common.base.Optional;
import com.google.common.base.Preconditions;

import pubgapi.vo.Player;
import pubgapi.messages.Messages;

/**
 * Created by Łukasz "Husar" Górny on 2017-07-11.
 */
public class PlayerValidationService {

    public void validate(final Player player) throws IllegalArgumentException {
        Optional<Player> playerOptional = Optional.fromNullable(player);
        Preconditions.checkArgument(playerOptional.isPresent(), Messages.CANNOT_FILTER_PLAYER_NULL);
        Preconditions.checkArgument(playerOptional.get().getAccountId() != null, Messages.CANNOT_FILTER_PLAYER_NULL);
        Preconditions.checkArgument(playerOptional.get().getMatches() != null, Messages.PLAYER_HAS_NO_MATCHES_PLAYED);
        Preconditions.checkArgument(!playerOptional.get().getMatches().isEmpty(), Messages.PLAYER_HAS_NO_MATCHES_PLAYED);
    }
}
