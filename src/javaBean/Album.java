package javaBean;
public class Album {
	private int a_id;
	private String u_id;
	private String a_title;
	private String flag;
	private String date;
	
	public int getA_id() {
		return a_id;
	}
	public void setA_id(int a_id) {
		this.a_id = a_id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getA_title() {
		return a_title;
	}
	public void setA_title(String a_title) {
		this.a_title = a_title;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public Album(int a_id, String u_id, String a_title, String flag, String date) {
		super();
		this.a_id = a_id;
		this.u_id = u_id;
		this.a_title = a_title;
		this.flag = flag;
		this.date = date;
	}
	@Override
	public String toString() {
		return "Album [a_id=" + a_id + ", u_id=" + u_id + ", a_title=" +
	a_title + ", flag=" + flag + ", date=" + date
				+ "]";
	}
	
}
