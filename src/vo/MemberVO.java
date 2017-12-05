package vo;

public class MemberVO {
	private String auth;
	private String id;			
	private String password; 	
	private String nickName;	
	private int point; 			
	private int lv;				
///////////////////////////////////////////////////////////////////////////////
	public MemberVO() {}
	
	public MemberVO(String auth, String id, String password, String nickName, int point, int lv) {
		this.auth = auth;
		this.id = id;
		this.password = password;
		this.nickName = nickName;
		this.point = point;
		this.lv = lv;
	}
///////////////////////////////////////////////////////////////////////////////
	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	public String getAuth() {
		return auth;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getLv() {
		return lv;
	}
	public void setLv(int lv) {
		this.lv = lv;
	}
///////////////////////////////////////////////////////////////////////////////
	@Override
	public String toString() {
		return "MemberVO [auth=" + auth + ", id=" + id + ", password=" + password + ", nickName=" + nickName
				+ ", point=" + point + ", lv=" + lv + "]";
	}
}