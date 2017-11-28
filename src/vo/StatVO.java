package vo;

public class StatVO {
	private String nickname;
	private int rating;
	private double win_Ratio;
	private double kill_Death_Ratio;
	private double damage_Per_Game;
	private double top10_Ratio;
	private int time_Survived_Per_Game;
	private int round_Most_Kill;

	public StatVO(String nickname, int rating, double win_Ratio, double kill_Death_Ratio, double damage_Per_Game,
			double top10_Ratio, int time_Survived_Per_Game, int round_Most_Kill) {
		this.nickname = nickname;
		this.rating = rating;
		this.win_Ratio = win_Ratio;
		this.kill_Death_Ratio = kill_Death_Ratio;
		this.damage_Per_Game = damage_Per_Game;
		this.top10_Ratio = top10_Ratio;
		this.time_Survived_Per_Game = time_Survived_Per_Game;
		this.round_Most_Kill = round_Most_Kill;
	}

	public StatVO() {

	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public int getTime_Survived_Per_Game() {
		return time_Survived_Per_Game;
	}

	public void setTime_Survived_Per_Game(int time_Survived_Per_Game) {
		this.time_Survived_Per_Game = time_Survived_Per_Game;
	}

	public int getRound_Most_Kill() {
		return round_Most_Kill;
	}

	public void setRound_Most_Kill(int round_Most_Kill) {
		this.round_Most_Kill = round_Most_Kill;
	}

	@Override
	public String toString() {
		return "StatVO [nickname=" + nickname + ", rating=" + rating + ", win_Ratio=" + win_Ratio
				+ ", kill_Death_Ratio=" + kill_Death_Ratio + ", damage_Per_Game=" + damage_Per_Game + ", top10_Ratio="
				+ top10_Ratio + ", time_Survived_Per_Game=" + time_Survived_Per_Game + ", round_Most_Kill="
				+ round_Most_Kill + "]";
	}
	
	

}
