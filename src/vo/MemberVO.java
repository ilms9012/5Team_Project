package vo;

public class MemberVO {
	private String id;
	private String password;
	private String name;
	private int point;
	private int lv;
///////////////////////////////////////////////////////////////////////////////
	public MemberVO() {}
	
	public MemberVO(String id, String password, String name, int point, int lv) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.point = point;
		this.lv = lv;
	}
///////////////////////////////////////////////////////////////////////////////
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", point=" + point + ", lv=" + lv
				+ "]";
	}
}
