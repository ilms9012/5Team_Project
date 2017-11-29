package vo;

public class StatVO {
	private String nickname;
	private String game_mode;
	private int rating;
	private double win_Ratio;
	private double kill_Death_Ratio;
	private double damage_Per_Game;
	private double top10_Ratio;
	private double time_Survived_Per_Game;
	private int round_Most_Kill;
	private double headshot_Kill_Ratio;
	private int wins;
	private int top_10;
	private int losses;

	public StatVO(String nickname, String game_mode, int rating, double win_Ratio, double kill_Death_Ratio,
			double damage_Per_Game, double top10_Ratio, double time_Survived_Per_Game, int round_Most_Kill,
			double headshot_Kill_Ratio, int wins, int top_10, int losses) {
		this.nickname = nickname;
		this.game_mode = game_mode;
		this.rating = rating;
		this.win_Ratio = win_Ratio;
		this.kill_Death_Ratio = kill_Death_Ratio;
		this.damage_Per_Game = damage_Per_Game;
		this.top10_Ratio = top10_Ratio;
		this.time_Survived_Per_Game = time_Survived_Per_Game;
		this.round_Most_Kill = round_Most_Kill;
		this.headshot_Kill_Ratio = headshot_Kill_Ratio;
		this.wins = wins;
		this.top_10 = top_10;
		this.losses = losses;
	}

	public StatVO() {

	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGame_mode() {
		return game_mode;
	}

	public void setGame_mode(String game_mode) {
		this.game_mode = game_mode;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public double getWin_Ratio() {
		return win_Ratio;
	}

	public void setWin_Ratio(double win_Ratio) {
		this.win_Ratio = win_Ratio;
	}

	public double getKill_Death_Ratio() {
		return kill_Death_Ratio;
	}

	public void setKill_Death_Ratio(double kill_Death_Ratio) {
		this.kill_Death_Ratio = kill_Death_Ratio;
	}

	public double getDamage_Per_Game() {
		return damage_Per_Game;
	}

	public void setDamage_Per_Game(double damage_Per_Game) {
		this.damage_Per_Game = damage_Per_Game;
	}

	public double getTop10_Ratio() {
		return top10_Ratio;
	}

	public void setTop10_Ratio(double top10_Ratio) {
		this.top10_Ratio = top10_Ratio;
	}

	public double getTime_Survived_Per_Game() {
		return time_Survived_Per_Game;
	}

	public void setTime_Survived_Per_Game(double time_Survived_Per_Game) {
		this.time_Survived_Per_Game = time_Survived_Per_Game;
	}

	public int getRound_Most_Kill() {
		return round_Most_Kill;
	}

	public void setRound_Most_Kill(int round_Most_Kill) {
		this.round_Most_Kill = round_Most_Kill;
	}

	public double getHeadshot_Kill_Ratio() {
		return headshot_Kill_Ratio;
	}

	public void setHeadshot_Kill_Ratio(double headshot_Kill_Ratio) {
		this.headshot_Kill_Ratio = headshot_Kill_Ratio;
	}

	public int getWins() {
		return wins;
	}

	public void setWins(int wins) {
		this.wins = wins;
	}

	public int getTop_10() {
		return top_10;
	}

	public void setTop_10(int top_10) {
		this.top_10 = top_10;
	}

	public int getLosses() {
		return losses;
	}

	public void setLosses(int losses) {
		this.losses = losses;
	}

	@Override
	public String toString() {
		return "StatVO [nickname=" + nickname + ", game_mode=" + game_mode + ", rating=" + rating + ", win_Ratio="
				+ win_Ratio + ", kill_Death_Ratio=" + kill_Death_Ratio + ", damage_Per_Game=" + damage_Per_Game
				+ ", top10_Ratio=" + top10_Ratio + ", time_Survived_Per_Game=" + time_Survived_Per_Game
				+ ", round_Most_Kill=" + round_Most_Kill + ", headshot_Kill_Ratio=" + headshot_Kill_Ratio + ", wins="
				+ wins + ", top_10=" + top_10 + ", losses=" + losses + "]";
	}

}